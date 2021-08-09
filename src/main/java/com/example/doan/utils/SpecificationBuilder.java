package com.example.doan.utils;

import com.example.doan.entity.SearchCriteria;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class SpecificationBuilder<T> {

    private final List<SearchCriteria> params;

    public SpecificationBuilder() {
        this.params = new ArrayList<>();
    }

    public void with(String key, String operation, Object value) {
        this.params.add(new SearchCriteria(key, operation, value));
    }

    public Specification<T> build() {
        if (params.isEmpty()) return null;

        List<Specification<T>> specifications = params.stream()
                .map((Function<SearchCriteria, DataSpecification<T>>) DataSpecification::new)
                .collect(Collectors.toList());

        Specification<T> combine = Specification.where(specifications.get(0));

        for (int i = 1; i < specifications.size(); i++) {
            try {
                combine = combine.and(specifications.get(i));
            } catch (Exception ignored) {

            }
        }
        return combine;
    }

    public Specification<T> resolve(List<String> params) {
        if (params == null) {
            params = new ArrayList<>();
        }
        SpecificationBuilder<T> builder = new SpecificationBuilder<>();
        Pattern pattern = Pattern.compile("(.*)(>=|<=|<<|!=|==|%|:|=|<|>)(.*)");
        for (String param : params) {
            Matcher matcher = pattern.matcher(param);
            if (matcher.find())
                if (matcher.group(3).equalsIgnoreCase("true"))
                    builder.with(matcher.group(1), matcher.group(2), true);
                else if (matcher.group(3).equalsIgnoreCase("false"))
                    builder.with(matcher.group(1), matcher.group(2), false);
                else
                    builder.with(matcher.group(1), matcher.group(2), matcher.group(3));
        }
        return builder.build();
    }

}

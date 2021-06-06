package com.consdata.task.controller;

import com.consdata.task.model.Task;
import com.consdata.task.service.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService taskService;

    @GetMapping(path = "/list-with-acl")
    public List<Task> listWithAcl() {
        return taskService.getTasksWithAcl();
    }

    @GetMapping(path = "/list-without-acl")
    public List<Task> listWithoutAcl() {
        return taskService.getTasksWithoutAcl();
    }

    @GetMapping("/{id}")
    public Task detail(@PathVariable Long id) {
        return taskService.getTaskById(id);
    }
}

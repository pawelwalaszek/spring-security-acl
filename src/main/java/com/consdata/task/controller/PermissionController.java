package com.consdata.task.controller;

import com.consdata.task.model.Task;
import com.consdata.task.service.PermissionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.model.Permission;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/permissions/{permissionName}")
public class PermissionController {

    private final PermissionService permissionService;

    @PutMapping(path = "/tasks/{taskId}/users/{username}/add")
    public void add(@PathVariable String permissionName, @PathVariable Long taskId, @PathVariable String username) {
        log.debug("permission name: {}, taskId: {}, username: {}", permissionName, taskId, username);
        permissionService.addPermission(username, Task.class, taskId, resolvePermission(permissionName));
    }

    private Permission resolvePermission(String permissionName) {
        switch(permissionName) {
            case "READ": return BasePermission.READ;
            case "WRITE": return BasePermission.WRITE;
            case "CREATE": return BasePermission.CREATE;
            case "DELETE": return BasePermission.DELETE;
            case "ADMINISTRATION": return BasePermission.ADMINISTRATION;
        }
        throw new IllegalArgumentException("Incorrect permission name");
    }
}

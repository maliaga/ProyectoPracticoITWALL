<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Mario Aliaga - ITWALL</title>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
</head>
<body ng-app="myApp" class="ng-cloak">
<div class="generic-container" ng-controller="UserController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">Formulario de Registro :: Proyecto Práctico ITWALL</span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.user.id"/>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Nombre</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.username" name="uname"
                                   class="username form-control input-sm" placeholder="Ingresar Nombre" required
                                   ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.uname.$error.required">Campo requerido</span>
                                <span ng-show="myForm.uname.$error.minlength">Largo minimo 3</span>
                                <span ng-show="myForm.uname.$invalid">Este campo es invalido </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Dirección</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.address" name="address" class="form-control input-sm"
                                   placeholder="Ingresar Dirección [Este campo esta libre de validación]"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Email</label>
                        <div class="col-md-7">
                            <input type="email" ng-model="ctrl.user.email" name="email"
                                   class="email form-control input-sm" placeholder="Ingresar Email" required/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.email.$error.required">Campo requerido</span>
                                <span ng-show="myForm.email.$invalid">Campo invalido </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Teléfono</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.telefono" name="telefono"
                                   class="form-control input-sm" placeholder="Ingresar Teléfono" required/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm"
                               ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm"
                                ng-disabled="myForm.$pristine">Cancelar
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">Lista de Usuarios </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID.</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="u in ctrl.users">
                    <td><span ng-bind="u.id"></span></td>
                    <td><span ng-bind="u.username"></span></td>
                    <td><span ng-bind="u.address"></span></td>
                    <td><span ng-bind="u.email"></span></td>
                    <td><span ng-bind="u.telefono"></span></td>
                    <td>
                        <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Editar
                        </button>
                        <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remover
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="<c:url value='/static/js/vendor/angular.js' />"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/service/user_service.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
</body>
</html>
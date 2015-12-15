var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var angular2_1 = require('angular2/angular2');
var people_service_1 = require('./people.service');
var People = (function () {
    function People(_peopleService) {
        var _this = this;
        this._peopleService = _peopleService;
        _peopleService.getPeople()
            .subscribe(function (res) { return _this.people = res; });
    }
    People = __decorate([
        angular2_1.Component({
            selector: 'people',
            templateUrl: './app/people/people.html',
            directives: [angular2_1.CORE_DIRECTIVES],
        }), 
        __metadata('design:paramtypes', [people_service_1.PeopleService])
    ], People);
    return People;
})();
exports.People = People;

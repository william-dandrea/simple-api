import {Controller, Get} from '@nestjs/common';

@Controller('main')
export class MainController {


    @Get()
    public async test(): Promise<any> {
        return "Hello World3"
    }
}

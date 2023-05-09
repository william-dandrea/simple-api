import { Module } from '@nestjs/common';
import { MainService } from './services/main.service';
import { MainController } from './controllers/main.controller';

@Module({
  providers: [MainService],
  controllers: [MainController]
})
export class MainModule {}

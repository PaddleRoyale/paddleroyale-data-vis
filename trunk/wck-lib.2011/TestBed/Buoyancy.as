﻿package {		import Box2DAS.*;	import Box2DAS.Collision.*;	import Box2DAS.Collision.Shapes.*;	import Box2DAS.Common.*;	import Box2DAS.Dynamics.*;	import Box2DAS.Dynamics.Contacts.*;	import Box2DAS.Dynamics.Joints.*;	import Box2DAS.Controllers.*;	import misc.*;		public class Buoyancy extends Test {						public function Buoyancy() {			super();			Main.txt.text = "Buoyancy";						var be:b2BuoyancyEffect = new b2BuoyancyEffect();			be.density = 1.5;			be.offset = -300 / scale;			var c:b2Controller = new b2Controller(this, be, true);			/*graphics.clear();			graphics.lineStyle(1, 0x0000ff);			graphics.moveTo(-2000, 300);			graphics.lineTo(2000, 300);*/			b2Def.body.type = b2Body.b2_dynamicBody;			b2Def.fixture.shape = b2Def.polygon;			b2Def.fixture.density = 1;			var body:b2Body;			var fix:b2Fixture;			for(var i:uint = 0; i < 50; ++i) {				b2Def.polygon.SetAsBox((Math.random() * 40 + 5) / scale, (Math.random() * 5 + 5) / scale);				b2Def.body.position.x = Math.random() * 720 / scale;				b2Def.body.position.y = Math.random() * 480 / scale;				b2Def.body.angularVelocity = Math.random() * 2 - 1;				body = CreateBody(b2Def.body);				fix = body.CreateFixture(b2Def.fixture);				//c.AddBody(body);			}			b2Def.fixture.shape = b2Def.circle;			for(i = 0; i < 50; ++i) {				b2Def.circle.m_radius = (Math.random() * 10 + 5) / scale;				b2Def.body.position.x = Math.random() * 720 / scale;				b2Def.body.position.y = Math.random() * 480 / scale;				b2Def.body.angularVelocity = Math.random() * 2 - 1;				body = CreateBody(b2Def.body);				fix = body.CreateFixture(b2Def.fixture);				//c.AddBody(body);			}		}	}}
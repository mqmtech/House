 Shader "MQMTech/FrontWall" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _Color ("Color", Color) = (1, 1, 1, 1)
      _SecondColor ("Second Color", Color) = (1, 1, 1, 1)
      _SecondColorYMax("_SecondColorYMax", Float) = 0
      _SecondColorYMin("_SecondColorYMin", Float) = 0
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf Lambert
      
      struct Input {
          float2 uv_MainTex;
      };
      
      sampler2D _MainTex;
      fixed4 _Color;
      fixed4 _SecondColor;
      half _SecondColorYMin;
      half _SecondColorYMax;
      
      void surf (Input IN, inout SurfaceOutput o)
      {
          o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * _Color.rgb;
          if(IN.uv_MainTex.y > _SecondColorYMin && IN.uv_MainTex.y < _SecondColorYMax)
          {
          	o.Albedo = _SecondColor;
          }
          
          half2 p = IN.uv_MainTex * 2 - 1;
          p.x *= 1.8;
          
          if(p.x > 0.0)
          {
          	p.x -= 0.3;
          	half sy = sin(p.y * 4) * 0.2 - sin(p.x * 10) * 0.005;
          	half d = length(p - half2(sy, p.y)) - 0.025;
          	d += pow(abs(p.y), 10) * 0.5;
          	d +=sin(p.y) * 0.06;
          	if(d < 0)
          	{
          		o.Albedo = _SecondColor;
          	}
          	
          	p.x -= 1.15;
          	sy = cos(p.y * 4 + 1.2) * 0.2;
          	d = length(p - half2(sy, p.y)) - 0.025;
          	d += pow(abs(p.y), 10) * 0.5;
          	d +=sin(p.y) * 0.06;
          	if(d < 0)
          	{
          		o.Albedo = _SecondColor;
          	}
  		  }
      }
      ENDCG
    }
    Fallback "Diffuse"
  }
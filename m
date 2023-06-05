Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q66pO-0000Tb-7H
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2023 05:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q66pM-0000TG-Qa
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 05:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q66pL-0006A3-69
 for qemu-trivial@nongnu.org; Mon, 05 Jun 2023 05:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685958518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYVYZuLvdZMl0iMLjQaUuztFa8CeN6BcnVxZhODyVEs=;
 b=LV8DvfAHT0Z5E8LIvIvIU0HGm40BQjs5z2v6FhHD3l40QB8hmIcJ6ppvHyEUTShp0zKi2z
 c0dtAVVOtTjCYel/JiVHj8Jo6nUJTmqKeIOnk9g+S0pGjt/cFFTSkx54di3s5MJbE/ExLp
 /aFD8WyQro6GeVjVW9t0C6PD2vEc7t0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-t8dKisL7Nx25E7s8CMkXPA-1; Mon, 05 Jun 2023 05:48:35 -0400
X-MC-Unique: t8dKisL7Nx25E7s8CMkXPA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-97463348446so260287366b.2
 for <qemu-trivial@nongnu.org>; Mon, 05 Jun 2023 02:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685958514; x=1688550514;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYVYZuLvdZMl0iMLjQaUuztFa8CeN6BcnVxZhODyVEs=;
 b=FO7eKpJrhJWvpVEqg12cmHv9xWuzLVF5ln0cTdsWVJurXR68lutlcsS5hGX2NyBIvg
 Wl0fArd6wwksej3WPmcb/x0v/xIw74t/io3OBhdA+pZVQ6yP3RXcsPBZCgFXy+S4qS3v
 2IHum6pltHwAlGjssc/ZJqK8pNfKrqJ0zuds5DW54fG3WeDcXgODGIX2t/cZ9lR1+Zmq
 vJ+Apqn71g27Rj0Y1TYthn/0brmEc9YC/fDM5S5c5iqzNpkyWUUOSlnIyqOmKTWMK9cG
 KOudXeL6laqGiAVmqfS6Z6fNpCYmWyOCdxD3fzIx825g4nyWOc7owKMVTXgPPGbL/R7w
 M80w==
X-Gm-Message-State: AC+VfDyYnqaYiYwsunRJKuTcoApTLVkuirlDMfrGaqsFyNdqxegYtWK4
 SLYSruUL839BkY4fxa5dg/E8/nPID2g04l1A4yg42DNtODb93SPPVOlFTM3ITNIOzmCPkisDy0R
 cl/nYOu7h5pLpU1+Puw==
X-Received: by 2002:a17:907:6e11:b0:94e:8559:b5c5 with SMTP id
 sd17-20020a1709076e1100b0094e8559b5c5mr5731903ejc.64.1685958514345; 
 Mon, 05 Jun 2023 02:48:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YP4fOTDpkt+1MTHrAmqlM/3j3B5bE+GIHjRKKTDhSULcv9MZpWI2OQMK+iRToKoym1IrCTg==
X-Received: by 2002:a17:907:6e11:b0:94e:8559:b5c5 with SMTP id
 sd17-20020a1709076e1100b0094e8559b5c5mr5731885ejc.64.1685958514028; 
 Mon, 05 Jun 2023 02:48:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a1709061c8f00b00965a52d2bf6sm4066978ejh.88.2023.06.05.02.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 02:48:33 -0700 (PDT)
Message-ID: <c1227ef3-259d-0855-f02c-7d62dd574072@redhat.com>
Date: Mon, 5 Jun 2023 11:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] meson.build: Use -Wno-undef only for SDL2 versions
 that need it
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-trivial@nongnu.org
References: <20230605082748.53989-1-pbonzini@redhat.com>
 <4352552f-67ba-b964-7a7e-b13c9b19a27c@redhat.com>
 <a6fc91db-a4e3-e9b7-ee51-d07cd4982f02@redhat.com>
In-Reply-To: <a6fc91db-a4e3-e9b7-ee51-d07cd4982f02@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jun 2023 09:48:41 -0000

On 6/5/23 11:05, Paolo Bonzini wrote:
> 
>> On 05/06/2023 10.27, Paolo Bonzini wrote:
>>> Queued, thanks.
>>
>> Please unqueue it again, I'm still seeing some issues with the patch 
>> (not sure why yet):
>>
>> https://gitlab.com/thuth/qemu/-/jobs/4411089009
> 
> Yeah, noticed that myself now. 😄

I think all you need is:

diff --git a/meson.build b/meson.build
index 025523f2065..3ec35c96fea 100644
--- a/meson.build
+++ b/meson.build
@@ -1345,7 +1345,7 @@ if sdl.found()
                       #include <SDL.h>
                       #include <SDL_syswm.h>
                       int main(int argc, char *argv[]) { return 0; }
-                     ''', dependencies: sdl, args: '-Wundef')
+                     ''', dependencies: sdl, args: ['-Wundef', '-Werror'])
      sdl = declare_dependency(compile_args: '-Wno-undef',
                               dependencies: sdl,
                               version: sdl.version())

Paolo



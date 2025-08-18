Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1060CA0ED1
	for <qemu-trivial@archiver.kernel.org>; Mon, 18 Aug 2025 08:05:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1unurO-0006pd-QN; Mon, 18 Aug 2025 04:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1unurL-0006gA-4Z
 for qemu-trivial@nongnu.org; Mon, 18 Aug 2025 04:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1unurI-0003MH-1u
 for qemu-trivial@nongnu.org; Mon, 18 Aug 2025 04:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755504286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MwORgzzmWBA7UmQWcYtfZdg8hAIXxj9acEXhafy5P/o=;
 b=jMlwB92w2XFafgQ65+gkGR/D5t2Q1PC9QVgtqz6Wra/XYRk31VKeDdNoAZk1VCgi9KsLe1
 hUvVemTrPHMjdGkfVSOqgY3SMgZyQtVUKACwRg2tE9hxugJoB2g65pCFHfduaZOYR5sLnX
 oGzRlcWlKQgLkuCbeWWIn3MCw1ogVkc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-QUYmYUz4PtK8ZMwiPoYNHg-1; Mon, 18 Aug 2025 04:04:44 -0400
X-MC-Unique: QUYmYUz4PtK8ZMwiPoYNHg-1
X-Mimecast-MFC-AGG-ID: QUYmYUz4PtK8ZMwiPoYNHg_1755504284
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e88f379fafso759855785a.0
 for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2025 01:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755504284; x=1756109084;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MwORgzzmWBA7UmQWcYtfZdg8hAIXxj9acEXhafy5P/o=;
 b=OyAnZkXG9dMrFUJ1Rlw5RPJEr4K8IL+aWaF9k7lrJnVwWc1abU3gl8o/ytrW33/mDK
 fEleQbxOXEYVeMeONR9cr7qWz876agHM5qgDQDFN98FVeqZTCDA3T5f2lN0sXw8eU5mG
 nEagRIkUNuiYxNN5eZ2p/jKCjYKsDhFic+kK7TuUbHT19QHol9QzNNzcvLMi9LDfeTDH
 RgcwYLQXBtm1U8YtEL9FM9ZlHm7FLAMKpAaJNiuyg6L/qaBgAjepgTxZ/pPyucmn+hzP
 LfVrqOtzAZLMxPcMwJ07O8pcmsDHUlKQ5Zb7MOP26oSFWiudWgU2GXazMDehsrl1kKIk
 ZMZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmPK3bLgCVO7F6uTpRZ8u+eu5x7Tagpg5UoH5CeJdP9p2K5vYY+vTHMlywiFLLoqvltuGUZ8xtPGG699A=@nongnu.org
X-Gm-Message-State: AOJu0YyhcufUM8u0QQb5I6A0DYXnWSY02aa7UZ+xD/37sN9hLHqH84P0
 Mjrl20Yx8I/jXLSXmcdSZmlcXo11UxoQs56fwJuihzobJVqzBXWNREG2R3TZRCUHpk6vzRuiWcF
 QUSmuTVOGZ1NAmdlov5z81Nutr6Zt7GEB7yXvXuv23NdMglvTiDZy8bCT0nk=
X-Gm-Gg: ASbGncsOy8+VGw0aXPgfxpcKS8BeU37QE2R1ipKp+DVOy8fNQOv7nRjbLVw24tYHKFk
 wPiOG7rMVhKStZ4Z7UlFbhjRmnHXxTL1kI8qxlrjrZUDs2fXsmavE4dGJPHvrvjBXJEkdUuF/dM
 BBdYSTGmKskyQMQ0j2p1dC2QbQZ9/4mvC76QG3QYLlY6V2xdAafD3kydpuvWIdYnEVWo4MHzX5u
 iPSrSPHrUg4bfyC3LCyeYJFIcpGjsRAg7vZHXKOLe2USwBLvGuCbVeou399n2o9++bRBhwdA7+e
 XxhnhenZC9YvdFGimpT7kBox170U80YnH3LeGXV7KKl4xvbtVj5WfxTCv3e5GkxbmIR9DiDjTll
 JmhY=
X-Received: by 2002:a05:620a:2802:b0:7d3:8ca0:65c6 with SMTP id
 af79cd13be357-7e87e0222e5mr1524354585a.20.1755504283962; 
 Mon, 18 Aug 2025 01:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6lTY1Bz3cAa0YEfRqEi1APJt89eWncdQhk6qgQY+wfC+euGhYcb75FFxUZIH7+ZsAKCmsMQ==
X-Received: by 2002:a05:620a:2802:b0:7d3:8ca0:65c6 with SMTP id
 af79cd13be357-7e87e0222e5mr1524351585a.20.1755504283442; 
 Mon, 18 Aug 2025 01:04:43 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-113-055.pools.arcor-ip.net.
 [47.64.113.55]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e87e027290sm558956785a.5.2025.08.18.01.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:04:43 -0700 (PDT)
Message-ID: <d1e64b7c-79cf-4a0b-8166-819c05c23111@redhat.com>
Date: Mon, 18 Aug 2025 10:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1] meson: Fix brlapi compile test for Windows builds
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20250806204624.510091-1-sw@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250806204624.510091-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xtCu0Slq3nVypYu6r-J3O2pFv1ChgQAg81kz2JqLxgE_1755504284
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 06/08/2025 22.45, Stefan Weil via wrote:
> brlapi__openConnection returns a brlapi_fileDescriptor which is a pointer
> for Windows builds.
> 
> The test for brlapi fails with cross builds on Debian trixie
> (x86_64-w64-mingw32-gcc (GCC) 14-win32):
> 
> testfile.c:4:30: error: returning 'brlapi_fileDescriptor' {aka 'void *'} from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
>      4 |      int main(void) { return brlapi__openConnection (NULL, NULL, NULL); }
>        |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -----------
> ../../../meson.build:1607: WARNING: could not link brlapi, disabling
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I think that this patch is trivial because it does not change
> anything for Linux.
> 
> Note that this patch only fixes the configure test and allows builds
> with the Braille API for Windows.
> 
> A similar change can be applied to chardev/baum.c and will be sent
> separately because it is not required for 10.1.
> 
> Note that for 64 bit Windows there is an issue because brlapi_fileDescriptor
> is a 64 bit pointer while QEMU assumes int for file descriptors. But the
> good news is that the resulting code seems to work nevertheless – at least
> the people who asked me for Braille support on Windows are satisfied as
> far as I know.
> 
> Regards,
> Stefan W.
> 
> 
>   meson.build | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index e53cd5b413..d6abe1917e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1586,9 +1586,11 @@ if not get_option('brlapi').auto() or have_system
>     brlapi = cc.find_library('brlapi', has_headers: ['brlapi.h'],
>                            required: get_option('brlapi'))
>     if brlapi.found() and not cc.links('''
> -     #include <brlapi.h>
> -     #include <stddef.h>
> -     int main(void) { return brlapi__openConnection (NULL, NULL, NULL); }''', dependencies: brlapi)
> +    #include <brlapi.h>
> +    #include <stddef.h>
> +    int main(void) {
> +      return brlapi__openConnection(NULL, NULL, NULL) == BRLAPI_INVALID_FILE_DESCRIPTOR;
> +    }''', dependencies: brlapi)
>       brlapi = not_found
>       if get_option('brlapi').enabled()
>         error('could not link brlapi')

Reviewed-by: Thomas Huth <thuth@redhat.com>



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5nuk-0004SH-J7
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jan 2022 07:00:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nuj-0004Ol-5g
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 07:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5nud-0004dy-R0
 for qemu-trivial@nongnu.org; Fri, 07 Jan 2022 07:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641556803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yat/Qsy2FZlmD3f4lls8Zub2EBCLL2GaAVY4ykhLn98=;
 b=YEAcuWQ1V/BKvoz2rP/p0PG3XsHyOdcZZCOpOaL6/Jo06OwS4l0O0A6u8573vfQtEmnhV+
 ffkrqiQz0gRyMijdesxnY+UetBe3nTLphRbkJa/1/4RbfBNEZefn13Wa1zQVymYx1cCzwH
 e9zU0WJ3gjR1ib6AlYYgzruy83bLE8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-0Thpc7CaNfmjQOmmSeC5_g-1; Fri, 07 Jan 2022 06:59:57 -0500
X-MC-Unique: 0Thpc7CaNfmjQOmmSeC5_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so3525778wmb.9
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 03:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Yat/Qsy2FZlmD3f4lls8Zub2EBCLL2GaAVY4ykhLn98=;
 b=3AdftAXEIAefFs5tSdubNpDsTXvRa0YpvfOPyEyNZHUTOyAz7bj7faQqqRq4KiFPfu
 FS5a/ZuVzGbI6Oca2lTHmFSB+nzjTKm7+NdOGSYQOaZWzNJKIHDK78T/CrGXTcbbuH2B
 ZwiL5PqVs6FSwADHxn1p/l66dpFY4pS1YFTttadD5tjQ0mKffNHktWPSHgiDZoV0x+ix
 PqTJZCAFMJvcbmE6oaarghzecg1Qyt5U1xmmOgcGCcQZITj4cuua50Uc7PuTR7I1WMwY
 /RyMrCbfbT///3zIy/ZVHWW3SSLoVTBTQaYG71Dkc4hY8kWqDspAgogDY0AM1BuucWlp
 Tnqg==
X-Gm-Message-State: AOAM5306cRVyWuNmtn1Lcl8Gkm4LDtQAdADSBQ/kxvavNMbGFsrxRsmC
 FyObG7Y0HQg9dlI63euWpwOLFGrUvCOt/U72yQHFj9iXyHnO2rJvziHJoK0WGdiItCK2qFNEIIu
 xBJbnpNjNAf0GsdqYKQ==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr51898475wro.493.1641556796143; 
 Fri, 07 Jan 2022 03:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXtfZh3AKHQeuTZFSgJQOz28emXWn8v60WvbU0KGs3HT0yLDvkshD1zoJwcadLVHKEj6G+zA==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr51898462wro.493.1641556795967; 
 Fri, 07 Jan 2022 03:59:55 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id az1sm1632135wrb.104.2022.01.07.03.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 03:59:55 -0800 (PST)
Message-ID: <1b6fa831-f99e-3693-d2d4-48bc271c9d46@redhat.com>
Date: Fri, 7 Jan 2022 12:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] meson.build: Print gtk version in the summary info
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220105190804.649316-1-thuth@redhat.com>
In-Reply-To: <20220105190804.649316-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 12:00:09 -0000

On 05/01/2022 20.08, Thomas Huth wrote:
> The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
> so there is just a "YES" in the summary info if gtk has been found.
> Let's use the info from the library detection instead so that the
> library version is printed in the summary instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 82769749db..798811dfbb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1058,11 +1058,11 @@ gtk = not_found
>   gtkx11 = not_found
>   vte = not_found

Drat, I'm missing a "libgtk = not_found" here ... I'll send a v2.

  Thomas


>   if not get_option('gtk').auto() or (have_system and not cocoa.found())
> -  gtk = dependency('gtk+-3.0', version: '>=3.22.0',
> -                   method: 'pkg-config',
> -                   required: get_option('gtk'),
> -                   kwargs: static_kwargs)
> -  if gtk.found()
> +  libgtk = dependency('gtk+-3.0', version: '>=3.22.0',
> +                      method: 'pkg-config',
> +                      required: get_option('gtk'),
> +                      kwargs: static_kwargs)
> +  if libgtk.found()
>       gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
>                           method: 'pkg-config',
>                           required: false,
> @@ -3410,7 +3410,7 @@ if targetos == 'darwin'
>   endif
>   summary_info += {'SDL support':       sdl}
>   summary_info += {'SDL image support': sdl_image}
> -summary_info += {'GTK support':       gtk}
> +summary_info += {'GTK support':       libgtk}
>   summary_info += {'pixman':            pixman}
>   summary_info += {'VTE support':       vte}
>   summary_info += {'slirp support':     slirp_opt == 'internal' ? slirp_opt : slirp}



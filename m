Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipHaP-0007HX-SF
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 15:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ipHaK-0007Dk-TC
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 15:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ipHaI-00078x-SH
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 15:05:44 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ipHaH-00076c-BK
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 15:05:42 -0500
Received: by mail-wm1-x341.google.com with SMTP id t14so220910wmi.5
 for <qemu-trivial@nongnu.org>; Wed, 08 Jan 2020 12:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=aoZmBCHq8KdFyuYwAZ29pK8yo9t5oHzC7+ZipSOnK4o=;
 b=xH3vD3drbsAplx28P//fQaNZ69lvMTMtOaSA31IQ1LlkVvvKFkHTsJqlYOu3yLvKvN
 aZ3EGuvSIeHQ8dJayblsPz4g4G+9lyYHja5rLxlzl+Kj28Vp7GlKbVPdWZfBMcpDDLJE
 RvAKY7G6GPJoT7neR9cazwMijmTOHooJeSFC1jJ3nH/sT4iJCnEqP1jdQb5V+Lzk6iV+
 iBAAKyOxMYz/pN78nDzuXo1Bf2BWZDB8eC4rgRdovOoG3tQAB9CrJwUqwYtESuqHXUYW
 MkcBvjcc560fFhrCkqG4Qpu6yiYaBaV4RoK68K2WUmhgtqm1+yTrVBczc6FPUgp47bcD
 InEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=aoZmBCHq8KdFyuYwAZ29pK8yo9t5oHzC7+ZipSOnK4o=;
 b=mWzbPQjeiXuwUfl40eCGjrDz/Gw7/r79hSSpY+CxbFUsXWfGzJpmMHACYmAFeac9Rf
 ReNUWSbRmW488e8C5vLd7WhRa3om8LLRBpMrFkAcDfkebyM+W5+0xYFFiuO/H8xGhZhs
 UpVJJzjuTMN7T52dtVIvcKxZFoXhLQ9RaRu1i2D6vukw6TU9TzkLw/a/DbEpy10DKaUP
 xe0t7o2Z8SLFaOVBDquo3ToYJBr4Y03PFsWW9kBDEUTvi61/BGogm/xs+ajkNyr2mooM
 6viN7+zVBQjeprBw7iS5yDWkty+/4beApW/eGyhNWVjvQvwvsDYUP5qKEprv3Nkfd+3v
 P3WA==
X-Gm-Message-State: APjAAAUsPS+dNg+gcrZ6sYQl9VivbUdHg9avoF10ZJ2VsrkscD4WzHXW
 a6OuS4wwakkuNXJErrfNScwmoA==
X-Google-Smtp-Source: APXvYqxQOd/CT6GuhQ5W7OLEVnUKro7qH1GUHWinp7c66KcmagTClyqKF2JChvnEzvyTZfmD5UwAzQ==
X-Received: by 2002:a7b:c949:: with SMTP id i9mr335569wml.131.1578513940140;
 Wed, 08 Jan 2020 12:05:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f127sm239202wma.4.2020.01.08.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 12:05:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D2AD1FF87;
 Wed,  8 Jan 2020 20:05:38 +0000 (GMT)
References: <20200108192402.19672-1-thuth@redhat.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] include/sysemu/sysemu.h: Remove usused variable no_quit
In-reply-to: <20200108192402.19672-1-thuth@redhat.com>
Date: Wed, 08 Jan 2020 20:05:38 +0000
Message-ID: <874kx5k92l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2020 20:05:46 -0000


Thomas Huth <thuth@redhat.com> writes:

> The no_quit variable has been removed in commit 78782712a62d56 ("vl: drop
> no_quit variable"), so let's remove the extern declaration in the header
> now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/sysemu/sysemu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 80c57fdc4e..686f4217a6 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -44,7 +44,6 @@ extern int alt_grab;
>  extern int ctrl_grab;
>  extern int cursor_hide;
>  extern int graphic_rotate;
> -extern int no_quit;
>  extern int no_shutdown;
>  extern int old_param;
>  extern int boot_menu;


--=20
Alex Benn=C3=A9e


Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgsBC-0000gq-E9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2019 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hgsAy-0000da-5U
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hgsAr-0003x9-AT
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:48:28 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hgsAl-0003nx-Lw
 for qemu-trivial@nongnu.org; Fri, 28 Jun 2019 10:48:20 -0400
Received: by mail-wr1-x444.google.com with SMTP id v14so6600835wrr.4
 for <qemu-trivial@nongnu.org>; Fri, 28 Jun 2019 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZitzNtQ5JwDH10v1ZnVBJDH+0ZF/VPgOgXa5rZY13Tw=;
 b=GwSanR8QEgHSCjGL852Stjr42v+FRA4c38w5520g96Q/OHZ3r9piXBAqFScdXAVR56
 e8wsZBIzdw3WOKdP4TmTXYwI5BwHuTrFJL9gCq3vneTuOCKYEVKR1fHgAMHAxRm784as
 kwVXvIzd/fOCx2wFfRNtBKz16iVCwdMLKvfflvNpjB0gatpyhZjTzSq663odq0dzHKHL
 fNAtfLqeGkTT5X0BYum5byPouIhcixzTFV9E2O8pMMzIP9hzyqZeXnTNjsukQT5L6adx
 ZJ2CJPSVg+rgyMGRp1IIlIw1dUcY8U7aNKTOgwtux+wu9ipUOy2fwTmGhWb+AZ6F4YXU
 JuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ZitzNtQ5JwDH10v1ZnVBJDH+0ZF/VPgOgXa5rZY13Tw=;
 b=YiOG40iQqNW/RMvJ820N64rsQ0GsdQuNZsSmX7vvDliXHUEUv2jLyNcQXupCDvFahg
 V2wNNVYLL0hkPW95wTJuXjgWvJHJ3/BNNryeWj07EPQx3xaTYWc6qIqhn0Lc9Q/K/pmW
 yMcABHdif4lbR5bpxVGVvucO/uO6oUeOF6JC1IIL3PjKQ9Q1zYQEE3Ueu74jPfxl5gZQ
 zEzEnUhH6n7v1aeFVpHfeAQ4cZrCa3+KBIn4W0iEeK4iEsUjZnb/d7yZg4k/qy3WgMRV
 NxD1pzqkAJ0ae1gH2xBSbe/Za5BfCu3ii8aSUxeh9VIzX9Eyzp6MOfYR324bcU44k8tz
 fGyw==
X-Gm-Message-State: APjAAAXhBvU4k0is/BJMajBo8S/SQofSmAN4DTkdwnoXzuZSRXXYt7Uq
 qxjSPFM93vtoGScymumGQqyr2HQ1pzA=
X-Google-Smtp-Source: APXvYqxw5maG5XujjMn5gAPNTRvFb9oMI0PU6woxiVdrx5CmLAIzVWsJtUeXiezgwmzs6atzjQu7vA==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr8196689wrf.78.1561733287592;
 Fri, 28 Jun 2019 07:48:07 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id o6sm5549589wra.27.2019.06.28.07.48.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 07:48:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54AF71FF87;
 Fri, 28 Jun 2019 15:48:06 +0100 (BST)
References: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
In-reply-to: <1561727317-30655-1-git-send-email-liam.merwick@oracle.com>
Date: Fri, 28 Jun 2019 15:48:06 +0100
Message-ID: <87pnmxahqx.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/devel/testing: Fix
 typo in dockerfile path
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
X-List-Received-Date: Fri, 28 Jun 2019 14:48:41 -0000


Liam Merwick <liam.merwick@oracle.com> writes:

> Signed-off-by: Liam Merwick <liam.merwick@oracle.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/devel/testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index da2d0fc9646f..3ef50a61db4d 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -327,7 +327,7 @@ Images
>  ------
>
>  Along with many other images, the ``min-glib`` image is defined in a Doc=
kerfile
> -in ``tests/docker/dockefiles/``, called ``min-glib.docker``. ``make dock=
er``
> +in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make doc=
ker``
>  command will list all the available images.
>
>  To add a new image, simply create a new ``.docker`` file under the


--
Alex Benn=C3=A9e


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsA1V-0005fE-8F
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2019 12:33:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gsA1S-0005eS-Je
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2019 12:33:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gsA1O-0007NM-N5
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2019 12:33:04 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gsA1M-0007Kz-Mm
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2019 12:33:02 -0500
Received: by mail-wm1-x344.google.com with SMTP id q21so4275938wmc.5
	for <qemu-trivial@nongnu.org>; Fri, 08 Feb 2019 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=qPt9dali8aEmEhkcxWwiiknnVWjbJMdHgtFlMRMbtN4=;
	b=kfyDKYTv9DFkP2hddNHgmuciQX/fJQo+64Z7I0XZZvWfRo+mbnqXz7BDfDO2TnNBA5
	Eu/Z+I/5bT08I4BYLAWsSlbTLN+CQvawdD9mRjeraxI/hOD9apj0EhGp6CmRv3M3Vx25
	D2Fro/Udj9M7jfYURUS83g2ZIozIGgX3yEHZfjEq3Vaph9TvLwEzC4wl/zB9VydGggu2
	ajU61QZ0JwB+cXw3zXVssqJNW7fJmdmAtDAXVCz/kDk+7cPo4D3yIQVuL8mIRQYHzThs
	nOBtqPEwZT1C+XEU3OOylRpTCpAtcTiwkvBcYWMMU2Qw8dptoMr5EBVCpgAY+iNHmePz
	7LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=qPt9dali8aEmEhkcxWwiiknnVWjbJMdHgtFlMRMbtN4=;
	b=NLuJPNMMAJoSkVSIYVlgKZ0w45w0SS3grlyshPNTrKft7FkIalKFJNV4W4LuuFc94Q
	gJbpdv5p9QCv9MS+k2bW8qHMvzKnKUt7gAgi+worv98vEioRkdlQCd+rNRkiXophWj8n
	T3J6FbySAKUoBOD5YKK+/GUZwFqsycV0cYbmjaoCJunjXpVPYpeK6yNxfNB4gN7RbsJ+
	PjdMdJlWbGpgLhsh9+7kar3Ywbh29pih0FG+AHENH7lKE69gJN9UP7cbs9rnqFjvgK/A
	aEoJ1882S85/3EySteqMckZn94CuNxPhUiRv1z+uemfC6DuGbEePbSy3aoizFgpJDnJH
	q95w==
X-Gm-Message-State: AHQUAuaVP6D/Rl28uZBGO7w2Esv9v7wcGQk4M+OYmoZfLAIApPkKzx1G
	0Cf14TU6jdG5/TxO5IEufvcsew==
X-Google-Smtp-Source: AHgI3IZlN5hp9H+mO6/wmu/MaiWpdBxvhsVPKhV8i+EA8s5iezsdswrtKK4uKWH3wTwmuXfuzGTZ7g==
X-Received: by 2002:a5d:4149:: with SMTP id c9mr234574wrq.58.1549647178455;
	Fri, 08 Feb 2019 09:32:58 -0800 (PST)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id z17sm3138844wrv.2.2019.02.08.09.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 09:32:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 522F01FF80;
	Fri,  8 Feb 2019 17:32:57 +0000 (UTC)
References: <20190207184346.6840-1-muriloo@linux.ibm.com>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org, mopsfelder@gmail.com, Philippe =?utf-8?Q?Mathie?=
	=?utf-8?Q?u-Daud=C3=A9?= <philmd@redhat.com>, Fam Zheng <famz@redhat.com>, 
	=?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Cleber Rosa
	<crosa@redhat.com>, qemu-trivial@nongnu.org
In-reply-to: <20190207184346.6840-1-muriloo@linux.ibm.com>
Date: Fri, 08 Feb 2019 17:32:57 +0000
Message-ID: <87va1ukwxi.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-trivial] [PATCH] docs/devel/testing: Add -a option to
 usermod command on docker setup
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2019 17:33:07 -0000


Murilo Opsfelder Araujo <muriloo@linux.ibm.com> writes:

> The option -G of usermod command will remove user from other groups
> not listed, i.e.: $USER will belong only to group 'docker' after
> following the documentation as is.
>
> From usermod(8) manual page:
>
>     If the user is currently a member of a group which is not listed,
>     the user will be removed from the group. This behaviour can be
>     changed via the -a option, which appends the user to the current
>     supplementary group list.
>
> This patch improves the situation by adding the -a option to the
> usermod command, which will just append user to the supplementary
> group list.
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Queued to testing/next, thanks.

> ---
>  docs/devel/testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 18e2c0868a..135743a2bf 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -301,7 +301,7 @@ An alternative method to set up permissions is by add=
ing the current user to
>  .. code::
>
>    $ sudo groupadd docker
> -  $ sudo usermod $USER -G docker
> +  $ sudo usermod $USER -a -G docker
>    $ sudo chown :docker /var/run/docker.sock
>
>  Note that any one of above configurations makes it possible for the user=
 to


--
Alex Benn=C3=A9e


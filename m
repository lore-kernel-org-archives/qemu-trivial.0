Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCPpV-0001B8-Dr
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 07:51:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPpU-00019b-0Y
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPpQ-0002si-62
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:51:40 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:52801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPpQ-0002sV-1t; Wed, 08 Nov 2017 07:51:36 -0500
Received: by mail-qt0-x229.google.com with SMTP id 31so3094418qtz.9;
	Wed, 08 Nov 2017 04:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7qGVVYi65qGOoOSt4m3IhGQ9uR9Dfn2RaeFwlxHi98Y=;
	b=P+AtYL7w7PuCxuTG5DhNU6L/KeOophwwCE/V/yh8aopLLby9ATlHljCr01YEVHRTVK
	ryrLZeVh0uBoJNoIF1U9B1fzvhghiexyVb/b/6vbD5SthTsIFU5tDIrm4S+qhwWlRHzg
	LwZuIZlho6uaAUn4/TG9oY2IVZBC1J/q7xc3p2ZXAXyyM+stwUWhkY08V3uCAgD78kvy
	4T1N6m49eNRlT4Dgs8/4kfN9etAhghvzR3SDr9WvkhtsFvbvpH+XqC+A1QdH8N/arUHm
	7ElAMmVYvEGXU2uag9TpqJd+ws5jK4xW+XcHiFsP4QkfW8D/g96tQBZrafgYCKbRLQyG
	k3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7qGVVYi65qGOoOSt4m3IhGQ9uR9Dfn2RaeFwlxHi98Y=;
	b=LEFDK1EA+d3EizUy0mZgPet3pAZbAOaV8LGBloeGjt/8sWgGqqeh9QaeM2HmsnhUB9
	17KWqtmtyzVw/IGZMH3qo9AYzozICW1G4M/yVXf5ihW32rn/6X1WLJoLkE3cECxRnO8F
	4SP+moYYDxEioQfEvxRT4R+yzXZZX82T6KP1Ir52LiGKIpZHUZ6iw2YqY0DRjAlVo6dR
	1JtdVl3vc9ck5VU+sSJHbzBxebqaOAOmZFQRVd/Tt2pliDB29Z4x9+DDMpP4HkvW2qXQ
	yDAjxzzbrbKHjx6qwQwdad7SBBnpFA25N47tYxb+GfVf6HbWk7OleBAM3tSfDbForhju
	JVSw==
X-Gm-Message-State: AJaThX5T9KiP5rYdb1tjWo90xIZKeXF4/FNkzSF1Ht9PyXpPV0ojZwrP
	LhsKCC06ZmJ6XE4FC2aq6yU=
X-Google-Smtp-Source: ABhQp+TE1E/LXEdzkZFdnnvWoUuykyzJk/IfdqOMdmQbigliyfVgXnL9+Sd779MXMfok9nzm6sHgrQ==
X-Received: by 10.237.58.225 with SMTP id o88mr553967qte.190.1510145495488;
	Wed, 08 Nov 2017 04:51:35 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u127sm2589287qkf.79.2017.11.08.04.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:51:34 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
References: <20170926210723.38042-1-carenas@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <cab436f4-5d5c-485e-a7da-0d844429c5a4@amsat.org>
Date: Wed, 8 Nov 2017 09:51:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20170926210723.38042-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] gitignore: ignore
 check-qlit test
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
X-List-Received-Date: Wed, 08 Nov 2017 12:51:40 -0000

On 09/26/2017 06:07 PM, Carlo Marcelo Arenas Belón wrote:
> test introduced in 382176b4d78e070d119af8e0dcd00884c11bbec2
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/.gitignore b/tests/.gitignore
> index cf6d99c91e..53cb2efaee 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -6,6 +6,7 @@ check-qdict
>  check-qnum
>  check-qjson
>  check-qlist
> +check-qlit
>  check-qnull
>  check-qstring
>  check-qom-interface
> 


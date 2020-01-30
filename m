Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixI3x-0003nb-35
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2020 17:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixI3u-0003k7-8J
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:13:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixI3t-0003vY-4L
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:13:22 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50084
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixI3t-0003uT-0m
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580422400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcaZJHEd3aXhrFd57TJJReH5qPBZeOxfkUdR6IzTX2M=;
 b=FExk4bv5qYEwiHFxlestu5bMIo60FSoCYZ59lVrcE5Cr3v1BzaGJOkF65hxXjcYOvlOduC
 Bo7+f41pRV4E7aOtItEBG+yqMB2j39jJMvLA7YWTDEZoOXp/t7u0t+eVdoKUIXtWDmkw3E
 LZbRz3Ngw7a5njLo8lZJUxVvPTyJm0o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-2qI9bLDUO5iQcqDRQd5rHg-1; Thu, 30 Jan 2020 17:13:17 -0500
Received: by mail-wr1-f69.google.com with SMTP id z14so2373604wrs.4
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2020 14:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DcaZJHEd3aXhrFd57TJJReH5qPBZeOxfkUdR6IzTX2M=;
 b=a1gvoBsRl0fhbw+sZp9vOqq+S19O52M9lCX04JL6UtbNakFg+8FxDx4C8H5WGOnBy0
 jnBNeOHycovN47bVZwNT6QnbKrSl2vjz7Zf7nTXC4H73uzp+D0KCVfVFp3wthRgUGF92
 vRdxaf/tnYbj0ywugEF6hGXOwWZwq/df8HIASBA/2rnKJvuJupr2BHIQPEJi20R8/zLz
 QoTt8lP4I0iNA8Ar73Z1XG1jukKSRIu7Ipqz2/Crd+F7N2hBlO6BnTt6OujLmSfHzvwE
 /1YZ1qR8EhBmPui0Yh7rO5A+0F7oYian5A+pemVVuhQ94qJHEjYFphduNkrMzWzHQ5QF
 Wibg==
X-Gm-Message-State: APjAAAW1jD+ZPSQ9c1gBwWUxat4PlasnaclbTJXeApTZHScxmfTXHLZO
 ChkMkqB55Y0jTaDxDqiU1/F4X0ELmJ+86StpJQII1LkDhi5+fR+t5BfR6HFkv3PXNpzdP2Zc8Gy
 dY0sjTKUBkcJpFL0uAQ==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr7565522wmj.36.1580422395853; 
 Thu, 30 Jan 2020 14:13:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwA2/b9ANm6Z3A+GueeXaWq31x3H5ViWxPZLXbFrPhCPPYVoyR0N3sfPH7AeCjdxW6XVHcSJw==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr7565510wmj.36.1580422395562; 
 Thu, 30 Jan 2020 14:13:15 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id z6sm8348657wrw.36.2020.01.30.14.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 14:13:14 -0800 (PST)
Subject: Re: [PATCH] qemu-deprecated: Remove text about Python 2
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20200109095116.18201-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a4875385-702d-4a8d-d208-0ee5f8782b90@redhat.com>
Date: Thu, 30 Jan 2020 23:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109095116.18201-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: 2qI9bLDUO5iQcqDRQd5rHg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 30 Jan 2020 22:13:23 -0000

On 1/9/20 10:51 AM, Thomas Huth wrote:
> Python 2 support has been removed, so we should now also remove
> the announcement text for the deprecation.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qemu-deprecated.texi | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 7033e531de..8b23e98474 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -341,14 +341,6 @@ they have no effect when used with @option{-n} to skip image creation.
>   Silently ignored options can be confusing, so this combination of
>   options will be made an error in future versions.
>   
> -@section Build system
> -
> -@subsection Python 2 support (since 4.1.0)
> -
> -In the future, QEMU will require Python 3 to be available at
> -build time.  Support for Python 2 in scripts shipped with QEMU
> -is deprecated.
> -
>   @section Backwards compatibility
>   
>   @subsection Runnability guarantee of CPU models (since 4.1.0)
> 

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next



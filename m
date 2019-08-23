Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i18pV-0007EN-GN
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 08:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i18pT-0007Ax-3A
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 08:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i18pQ-0005Fh-88
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 08:38:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i18pQ-0005FI-0Q
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 08:38:04 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B3C483DE04
 for <qemu-trivial@nongnu.org>; Fri, 23 Aug 2019 12:38:02 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id c14so4303064wml.5
 for <qemu-trivial@nongnu.org>; Fri, 23 Aug 2019 05:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PRL/FSVEo0YfzA9EGloXDSoUR/S1PFJDhLfEHy07+zA=;
 b=f6jwTJfaNfhyYtIPUbqb4u++miOUs6006JApoRTxXn2rJx/xC/lOaA65Q/uHyjKaD/
 1CzfFBqjqhlrE90tD5WgbXu/6okWPfZ9GM9SsAUKklbjfY/209VKIiPzUytUDJYzQ/0s
 iFngL1Ai4B5tyI8LcC5e1NnQuugdGeDaarvoa/hfHtxTw/hhZIuglxnssoFxfCxDJYWD
 rl8f/sGp4kcBCI61LwYPSD64Ll12+2wxmXX7HZPrMXN9PRedTCNe0PjLC5mq3oF+dAPY
 dfdTPuAHk0rxiZKWOiEhRxg4N0sSbhbuokjiwon+B1huO8aP9qFldbxLqZ/pfQdCL867
 37UQ==
X-Gm-Message-State: APjAAAXdnLVNnWcFOSgo9w0NHeS2mtO3ZVzwZlXJCz0mbGMLWjmn7faj
 mZNRd8jayfV7aqvuGQTSKTcTxXIPRMdIfQHVSr5+LYq6axLLe9NnEcBQIwvDxieRtlds5FBtw6j
 sE5CJPnfm52Otk9lUsw==
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr5282548wml.64.1566563881396; 
 Fri, 23 Aug 2019 05:38:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEo8du5YX9gfDSM/kyJluKNmwys5YqKM/HPVBjNjxYmbJOiDmr2jY3sYX6pu8yF7nGbOq7PA==
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr5282537wml.64.1566563881231; 
 Fri, 23 Aug 2019 05:38:01 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id t13sm3292287wrr.0.2019.08.23.05.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2019 05:38:00 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190822230916.576-1-philmd@redhat.com>
 <20190822230916.576-4-philmd@redhat.com>
 <CAL1e-=hypCsXVMhU5nC8O7JuDHN89huaMSe5RrJ27YB9W+AK_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <304fdaf2-7106-2333-9caf-85fbe940df8d@redhat.com>
Date: Fri, 23 Aug 2019 14:37:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hypCsXVMhU5nC8O7JuDHN89huaMSe5RrJ27YB9W+AK_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] mailmap: Add many
 entries to improve 'git shortlog' statistics
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
X-List-Received-Date: Fri, 23 Aug 2019 12:38:08 -0000

On 8/23/19 11:44 AM, Aleksandar Markovic wrote:
> 23.08.2019. 01.10, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com
> <mailto:philmd@redhat.com>> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> All of these emails have a least 1 commit with utf8/latin1 encoding
>> issue, or one with no author name.
>> When there are multiple commits, keep the author name the most used.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
> <mailto:philmd@redhat.com>>
>> ---
>=20
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com
> <mailto:amarkovic@wavecomp.com>>
>=20
> Out of the scope of this patch, what about the cases like Mateja
> Marjanovic, who contributed with both Mateja.Marjanovic@rt-rk.com
> <mailto:Mateja.Marjanovic@rt-rk.com> and mateja.marjanovic@rt-rk.com
> <mailto:mateja.marjanovic@rt-rk.com> ?

GIT-SHORTLOG(1) manpage is not clear about how it handles email casing.

Anyhow, this last section only clean the author name (utf8/latin1
encoding issue), there is no change in the email.

So in Mateja case, since the author name is the same, it is fine:

  Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
  Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>

Thank you for your review!

Phil.


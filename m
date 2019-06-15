Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hc1Tg-0007Pm-7O
	for mharc-qemu-trivial@gnu.org; Sat, 15 Jun 2019 01:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hc1Td-0007P2-Td
 for qemu-trivial@nongnu.org; Sat, 15 Jun 2019 01:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hc1Td-0002Sl-0Z
 for qemu-trivial@nongnu.org; Sat, 15 Jun 2019 01:43:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36219)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hc1Tb-0002R6-CV
 for qemu-trivial@nongnu.org; Sat, 15 Jun 2019 01:43:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so4583511wrs.3
 for <qemu-trivial@nongnu.org>; Fri, 14 Jun 2019 22:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v5uGUGq9ev6R+H4vzK2nrBhCNgR8tvot74Yt1F50TKo=;
 b=sBzU/LXKxmOcOZz+no4jHUeawzmCO4mYF0jpbQjRgA76h6lG4Z5XRIW7nLI3Vl8yvl
 7ImvWBYwoxim/2aT+NyZFYwUYOV/OkunAAmW9JMGIpBPxflu5RQNLArqMPeGhpj1grBL
 iczMlEjaKo8DrR3Olt/uXoBNwZl91amYSJVwLcBAdvkDGNtkhpSLZvDB0zUqXQaP4A6z
 L/yBoUd/8Ot/9C3m+bUeQx7uS59Ry3Q1nC3eg59M4oM5e/BCMHun1rDgK0hECwmTH4IH
 gFq2ad1JIdSX0D3OeN7pS8MDtRhZ8l+Ev6TOUhNvbgWQBzWEGaZKzsYFkjhDaFvnqPLL
 AfcQ==
X-Gm-Message-State: APjAAAXPUzSMEEd1vEumXZPwlkuaMcStyd6tO2VUdEblpYOEncz1vYPb
 xmKCcpr2HkNJE8/zcl553mrlp+sRPRw=
X-Google-Smtp-Source: APXvYqz6oVdYa21FoxChzcAe92WyeRLlJbKETDN0V04FIGKVwpstsR9id2zDYQjzPZTBe0JzAfG6qw==
X-Received: by 2002:a05:6000:d1:: with SMTP id
 q17mr14935061wrx.40.1560577422214; 
 Fri, 14 Jun 2019 22:43:42 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id 34sm4892657wre.32.2019.06.14.22.43.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 22:43:41 -0700 (PDT)
To: Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <155912548463.2019004.3515830305299809902.stgit@bahia.lan>
 <20190529125926.GD2126@perard.uk.xensource.com>
 <20190605121056.0e784daf@bahia.lab.toulouse-stg.fr.ibm.com>
 <c85d973ca2d444678e8fdc86a4cd6f4f@AMSPEX02CL03.citrite.net>
 <20190614101621.098742e2@bahia.lan>
 <c2c63dd46c684b1bb0f2e342a085d93d@AMSPEX02CL03.citrite.net>
 <alpine.DEB.2.21.1906140844150.2072@sstabellini-ThinkPad-T480s>
 <20190614185054.6f12ab30@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b40f16eb-5ae5-4b36-e0a8-02b10c3b7769@redhat.com>
Date: Sat, 15 Jun 2019 07:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614185054.6f12ab30@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Change
 maintership of Xen code under hw/9pfs
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
X-List-Received-Date: Sat, 15 Jun 2019 05:43:46 -0000

Cc'ing qemu-trivial@

On 6/14/19 6:50 PM, Greg Kurz wrote:
[...]
> Markus, Xen maintainers,
> 
> All needed Acked-by have been provided. I don't plan to send a 9pfs PR
> anytime soon. Can this go through someone else's tree please ?
> 
> Cheers,
> 
> --
> Greg
> 


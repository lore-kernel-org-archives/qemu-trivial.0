Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9nsq-0004oO-Jz
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9nso-0004l3-2b
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:37:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9nsm-0001Jl-Q8
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:37:37 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47461
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9nsm-0001Fw-Mc
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583404650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1jtqUOiDyJWfbsH0y3MGloQy0LFzf5sRFvE+Olrdxk=;
 b=Q4KdC1k3t4wVZcl3/4zxA/4G8eGHAsW6VgzXt8Yz0VYaO25u/h55FcNh19MrWHrVYpiOZF
 iQxESFkkRuAlKHRPl/xSIHY3CJQE+M9do40Dsaii2VeWdf/nBbj/XfD+s9NdA/AbubUeMD
 8+QvWg7docFOQqOrI4K++DKw2ciyZXA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-BiO59gBpOXK3JR8l_lmP0w-1; Thu, 05 Mar 2020 05:37:26 -0500
X-MC-Unique: BiO59gBpOXK3JR8l_lmP0w-1
Received: by mail-ed1-f70.google.com with SMTP id n12so4028657edq.13
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 02:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N+cxLmP08Sog3fQ2kUzzCL1tQJ8Fhjt86s7D+fDGMR8=;
 b=UQFZIP78+4Abah7OUUpVJpYgyhSquxtCkCj4X+OxMO6/VkC9P5WFh9+A51qoMEK7XT
 6RVv/2zrm6lAQQBHc0MzOowIlDd+dsarcGzINjvcXevWboB2z+WAwp3X+3OjV/m2E31y
 Vtpo6sSVT6SLjR1D00kZAke+eLyNZy4LEMWGPRrDqWHh8xMS5n7H6FQhNsao5abmoTc7
 K8miuHAYv4I4aG2EEkZKGt/ua22m8qqZnC2O5pbFoHScQjR6xX+yIhz8jEZddA7Ezcja
 tSaDwtdUiNS3aqmG3fOUhk/q0iQgUg8DmsVsAYIVEas7lDBmfvtpv0FjVKAj/QqrLvHc
 FcJQ==
X-Gm-Message-State: ANhLgQ2+1o9AF5HP5BQTCndyXcZJbfGRXW+4iBupfod/2PRoqr4QGcLg
 XJkh8VjXSXhGUInc0cC4uVHLnDQJeX3rvEvhd9t3anCtj3M3DJnjs1CD232qM/ahGt508/c4jH9
 AodzSwx2gbCdfBTCWJw==
X-Received: by 2002:a17:906:970f:: with SMTP id
 k15mr6706519ejx.334.1583404644813; 
 Thu, 05 Mar 2020 02:37:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvA4U4MgmVJt4DZ4gjM43QVnANIvUnYIs48IrIZkKZWBuoGAgvMpdHBwiXxpkWQqKN8WOgpog==
X-Received: by 2002:a17:906:970f:: with SMTP id
 k15mr6706497ejx.334.1583404644603; 
 Thu, 05 Mar 2020 02:37:24 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b23sm436021ejq.84.2020.03.05.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 02:37:24 -0800 (PST)
Subject: Re: [PATCH 0/3] hw/net,virtfs-proxy-helper: Reduce .data footprint
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200305010446.17029-1-philmd@redhat.com>
 <20200305095357.nvhjz7q7tuquys4k@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8488759c-022a-1c74-c9a1-ad223959494b@redhat.com>
Date: Thu, 5 Mar 2020 11:37:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305095357.nvhjz7q7tuquys4k@steredhat>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 05 Mar 2020 10:37:39 -0000

On 3/5/20 10:53 AM, Stefano Garzarella wrote:
> On Thu, Mar 05, 2020 at 02:04:43AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> More memory footprint reduction, similar to:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00984.html
>>
>> The elf-dissector tool [1] [2] helped to notice the big array.
>>
>> [1] https://phabricator.kde.org/source/elf-dissector/
>> [2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support=
.html
>>
>=20
> Thanks to share these links!

FYI the heap equivalent (besides that more powerful) is:
https://github.com/KDE/heaptrack

>=20
>> Philippe Mathieu-Daud=C3=A9 (3):
>>    hw/net/e1000: Add readops/writeops typedefs
>>    hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>>    virtfs-proxy-helper: Make the helper_opts[] array const
>>
>>   fsdev/virtfs-proxy-helper.c | 2 +-
>>   hw/net/e1000.c              | 6 ++++--
>>   hw/net/e1000e_core.c        | 6 ++++--
>>   3 files changed, 9 insertions(+), 5 deletions(-)
>>
>=20
> Cool and clear changes!
>=20
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>=20
> Thanks,
> Stefano
>=20



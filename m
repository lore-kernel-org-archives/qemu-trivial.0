Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSCaR-0005IS-V5
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 22:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSCaQ-0005HD-7a
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 22:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSCaN-0002Ie-AU
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 22:29:38 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:41077)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSCaL-0002FF-Ir; Sun, 10 Jun 2018 22:29:33 -0400
Received: by mail-qt0-x244.google.com with SMTP id y20-v6so18967462qto.8;
	Sun, 10 Jun 2018 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p06AHcWU4I77+qyGuer7GO6zv3BXfQoKTH46NnqgjGo=;
	b=pA731DjrRqcNRL+BJnYFngeaQD2veKSiLLjvucQS/4N9254aJOO0dAASgfmqoJ/XMc
	Hmx4UDhFYTuDb4WhnhT6ZVJC3F307oikBAEMTUuwihJKRm+3jr1mkCQijY8UcwNZWMY5
	ZlgAxY5Al1q/bKW5X0xaJNm/W1LxoglYFf0nwIJ58Nxug+m0+CZ4h7q1by/c/lFywGIO
	M4v3rsUocO8mw6qVJWl76lw2aEl+BaizGqe1sFuBbW8uq9Qy+ql0YodGEpqW+7HH+3MJ
	1je5oxoMJl3D6+Wg2J5kgsdkk8fimuef2OyLYDPt/KuJGCGw3KDvvam2y11hmnVyWV/S
	zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=p06AHcWU4I77+qyGuer7GO6zv3BXfQoKTH46NnqgjGo=;
	b=TQ9nWzzeCcHdtvMbi47l7VeDtlNUlrYl9ORTxS7mkjfeuSz1Js4moZW7yBOyCgNAXV
	djS56TPIy4FbXy9coi0+rQtxh3NSLXnWQ5VK7+IB/LrMChbuFScDNgroXiVFdTeZ6E5T
	ImnlVEVpxLnvWtNqtB0BGqPTAQ0JcNOmIs/lh0NLa1WXd0VzpENAw+zGK3qb+sSR7+o+
	tnTyYijq4DJTriLQoHGRwdqM/TAq9OIia+ZZVDN1jm7FoSGbDNOP7uO5yH//Giy3Fx1k
	rpFKo2w2UBD5d5vTI/B5fQONEAcNGahjFaPCYACuDTCPo9zqiE1KXu2AhK/FstFQG3a6
	YxYg==
X-Gm-Message-State: APt69E0mLGd3kIm351hcbYyBxPwk7wC3fLiRgVvOPN9n0S1v0h9qf6TX
	x6vjk5a/u53XKE6YyFDYzXE=
X-Google-Smtp-Source: ADUXVKLN6D/TfXwnN6wbwPHp1Ulbiq5S7FHLoQX7wtw14qMRORX9nQcsm3RF56vnFMwNnps4IHN16A==
X-Received: by 2002:aed:39ea:: with SMTP id
	m97-v6mr9394536qte.231.1528684173115; 
	Sun, 10 Jun 2018 19:29:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m70-v6sm30070816qkl.72.2018.06.10.19.29.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 19:29:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-34-f4bug@amsat.org>
	<20180611051748-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <176ffaf5-69fb-82db-f579-6db8aac3169d@amsat.org>
Date: Sun, 10 Jun 2018 23:29:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611051748-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 33/40] hw/i386: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 02:29:39 -0000

On 06/10/2018 11:18 PM, Michael S. Tsirkin wrote:
> On Sun, Jun 10, 2018 at 10:14:54PM -0300, Philippe Mathieu-Daudé wrote:
>> @@ -1392,11 +1393,11 @@ void pc_memory_init(PCMachineState *pcms,
>>          }
>>  
>>          machine->device_memory->base =
>> -            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, 1ULL << 30);
>> +            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, GiB);
>>  
> 
> 
> For some reason, GiB got special treatment. Why not 1* GiB?

Oops I didn't notice, I really prefer "1 * GiB" too.


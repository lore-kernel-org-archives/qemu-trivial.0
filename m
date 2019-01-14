Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj1KZ-0004IG-SH
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 07:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1KX-0004Hn-F2
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 07:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1KW-0004WN-HG
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 07:27:01 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj1KW-0004Vs-AJ
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 07:27:00 -0500
Received: by mail-wr1-f68.google.com with SMTP id t27so22608053wra.6
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 04:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UX4gixjijR/Q3KpEwDUUZP4ATF12DyY7qE1Kxb77zHY=;
	b=o1q1mKkyDLgjWFFPcrlPvPhTbUGK1wIDE+rITJM0c88CSwsrzvBI4Ki6xK33i1FZ5v
	txSk2cbcF6MFQV+2kxWZ1vyaUBRW0VFrmOvycBE/jEV4zpcTpv3lCBKJEoq+I85fihJZ
	b/SKQrSP3a0lIT+xNaIUisAxVBb6Lne6v+gVok/1JXoOl6UZ8itfwHcyTJTaf65GE/3n
	Y2CUsYGYCP4caHDbH0T/KF/LwY2ZZx00Htd7wWb7IgIabQr+fgJXMrNv94vtevQFBfCa
	JY9psS38TnAv6/Q2WWjj45gfwRlW1fltW2GvwFnGWa+5Bb7oSZ0YtiiabvcoV7K87O+P
	LOHA==
X-Gm-Message-State: AJcUukdEIVGW8qCCI/GYCb/BRCncegQjKc5Vhcst5Go66nIVHQO7/uvs
	KfD6ZfMIo5JoA9juNZSLl1y26A==
X-Google-Smtp-Source: ALg8bN7ShA3kNCVkL0N5JHb0kwSPC2NnEBS2pXMBKDbqODlEfruFGHARh+itBU/p4qq9RK9MTAxyzQ==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr23730629wrw.311.1547468818757;
	Mon, 14 Jan 2019 04:26:58 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110])
	by smtp.gmail.com with ESMTPSA id 3sm31345911wmw.46.2019.01.14.04.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:26:58 -0800 (PST)
To: Max Reitz <mreitz@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, "Richard W.M. Jones" <rjones@redhat.com>,
	Liu Yuan <namei.unix@gmail.com>
References: <20181213162727.17438-1-lvivier@redhat.com>
	<62bd556c-93e2-d5d0-117c-7e3b8a28ea1c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <246ba1a4-a6a3-128d-c535-75674c6f2911@redhat.com>
Date: Mon, 14 Jan 2019 13:26:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <62bd556c-93e2-d5d0-117c-7e3b8a28ea1c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/4] block: Convert from
 DPRINTF() macro to trace event
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
X-List-Received-Date: Mon, 14 Jan 2019 12:27:02 -0000

On 1/14/19 1:14 PM, Max Reitz wrote:
> On 13.12.18 17:27, Laurent Vivier wrote:
>> Convert all the remaining uses of DPRINTF() in the directory block.
>>
>> Compiled for all target but only tested with "make check"
>>
>> v2: replace "sd_" prefix by "sheepdog_"
>>     remove the dot at the end of the text strings
>>     use %zu with size_t
>>     change an uint64_t to int64_t to match % PRIi64
>>
>> Laurent Vivier (4):
>>   block/ssh: Convert from DPRINTF() macro to trace events
>>   block/curl: Convert from DPRINTF() macro to trace events
>>   block/file-posix: Convert from DPRINTF() macro to trace events
>>   block/sheepdog: Convert from DPRINTF() macro to trace events
> 
> Applied to my block branch, with three fixes (Philippe asked me to do
> one, so what are two more O:-)):
> - Patch 1: Fixed ssh_{read,write}_return's @ret sign
> - Patch 3: Moved the pointer asterisk in file_xfs_discard from type to name
> - Patch 4: Fixed sheepdog_snapshot_create_inode's format string to use
> PRIx32 instead of %x for uint32_ts

Thank you Max!

> 
> (https://git.xanclic.moe/XanClic/qemu/commits/branch/block)
> 
> Thanks!
> 
> Max
> 


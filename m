Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goUyE-0002l3-TT
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 10:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goUy2-0002WQ-KP
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:06:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goUxg-00055S-9J
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:06:13 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goUxf-000506-KM
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 10:06:04 -0500
Received: by mail-wm1-f67.google.com with SMTP id y8so18118148wmi.4
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 07:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7NsmYwHoSfWcp4bp4Wprjc5KbdcEjYB5QSSHqiLeHHo=;
	b=WPMzI1zFasVZeSLjKqy9eLdPW+44XyKy13Vc+1oKz6SWSaXx83exwZgg+t1NTgt31X
	joTPqTDrMlwVher9e1qgbHcF18+RmKp3sbY9kxof/QlaHtuqRksCfouEw3nllyIFelZ9
	7WFeKImr1lO+5BYNEg1xBxzxw8Xj9WxlpaHdHa2IyA6+3tjn/AsO9soTz7lwxsuHPhZA
	crCvNSaWfBCYu+lUC5AwLAnXzpsim6gZvPkhotktaAOvnYVOZwgQM+dudFgl+RMx+flx
	mOeQXFHvQGMRrEPharZzn8JNJGSZBIMXxGypWGlfYACBoOWObdpeqzCHRQAgTz56yl66
	NDZQ==
X-Gm-Message-State: AJcUukfl0o+aEYdJ7BFIzf/CtZtDJjCFm/EkHKPzxOtjYElwxy4fD2T6
	/QP0FvgZyCjXCL/h/CvuNvEdZw==
X-Google-Smtp-Source: ALg8bN6Atn8EOgUts592zGvRQffgcOq2d+REOvQ/NrDy8mSiwCbycQCuVcEfeuSviYP+lIrw2Y8c9Q==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr22154463wmg.51.1548774348652; 
	Tue, 29 Jan 2019 07:05:48 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	n127sm4090664wmd.20.2019.01.29.07.05.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 07:05:48 -0800 (PST)
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <1548769067-20792-1-git-send-email-thuth@redhat.com>
	<20190129145156.6719b8a4.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f98acef2-90b7-6ae3-682a-504a29ad57b4@redhat.com>
Date: Tue, 29 Jan 2019 16:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129145156.6719b8a4.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/s390x: Fix LGPL
 version in the file header comments
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
X-List-Received-Date: Tue, 29 Jan 2019 15:06:38 -0000

On 1/29/19 2:51 PM, Cornelia Huck wrote:
> On Tue, 29 Jan 2019 14:37:47 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> It's either "GNU *Library* General Public License version 2" or
>> "GNU Lesser General Public License version *2.1*", but there was
>> no "version 2.0" of the "Lesser" license. So assume that version
>> 2.1 is meant here.
> 
> I think we can assume that.
> 
> Given that there have been several of these cases (and that there's a
> lot of boilerplate in general): Should we adopt SPDX license
> identifiers for QEMU, as the Linux kernel did? They also discovered and
> fixed some problems/oddities while at it.

This might be cheaper than adding checkpatch rules to parse current
licenses to avoid miswritten one coming back...

>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  target/s390x/cc_helper.c   | 2 +-
>>  target/s390x/excp_helper.c | 2 +-
>>  target/s390x/fpu_helper.c  | 2 +-
>>  target/s390x/gdbstub.c     | 2 +-
>>  target/s390x/helper.c      | 2 +-
>>  target/s390x/int_helper.c  | 2 +-
>>  target/s390x/mem_helper.c  | 2 +-
>>  target/s390x/misc_helper.c | 2 +-
>>  target/s390x/translate.c   | 2 +-
>>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> Is this going through the trivial tree? If so,
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> 
> I can also take this through the s390x tree.
> 


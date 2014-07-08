Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4O7V-0000uI-Qk
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jul 2014 01:39:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X4O7N-0000rz-8v
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 01:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X4O7H-0003yp-Iy
	for qemu-trivial@nongnu.org; Tue, 08 Jul 2014 01:39:05 -0400
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231]:37380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1X4O7H-0003yl-4F; Tue, 08 Jul 2014 01:38:59 -0400
Received: by mail-qg0-f49.google.com with SMTP id f51so4599688qge.36
	for <multiple recipients>; Mon, 07 Jul 2014 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=EOuFGx86Veb0QHoWaHcesdBGwuNEgeAHZly3LxcEy50=;
	b=EAOM9pO+AQ31pJlYumqQxL3evYe4wtquIXu84W+bxWoFnO9/P2hO3jsVX3ImRqkBtb
	Za5PVqXXiV0/azS6xYeu1+WA+hHSf0vfRqtOQC15py2TAC79VqUuBdWgnFd4slg0rJjA
	ngIObSbwYwGxMw6eHdZ0Ti04hD5DhvvBkI9x1DVPw6NdwHoPz8torkezv7uwv/mxzbZ+
	u4BZnrirMQhxO6e/gOiHxxREvnaR8QP6L7oHFXone34ydhLb/WxdTweocIBbvXaZ8/18
	hfgIy6G2NsI9dY3qRiX4lxHeA2NOtAFOW2nm00bq26T1+GzGVU7TBj0c8capEJklMY2a
	rsIw==
X-Received: by 10.140.19.109 with SMTP id 100mr53597818qgg.80.1404797938680;
	Mon, 07 Jul 2014 22:38:58 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-2-35-201-190.cust.vodafonedsl.it.
	[2.35.201.190])
	by mx.google.com with ESMTPSA id y4sm78799242qad.14.2014.07.07.22.38.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Jul 2014 22:38:57 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53BB83EE.3020307@redhat.com>
Date: Tue, 08 Jul 2014 07:38:54 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, 
 Peter Maydell <peter.maydell@linaro.org>
References: <1403643149-30440-1-git-send-email-sw@weilnetz.de>	<53A9E789.8040809@redhat.com>
	<53BAF51D.1040803@weilnetz.de>
In-Reply-To: <53BAF51D.1040803@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: Fix new compiler error with
	-Wclobbered
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 05:39:11 -0000

Il 07/07/2014 21:29, Stefan Weil ha scritto:
> Am 24.06.2014 23:03, schrieb Paolo Bonzini:
>> Il 24/06/2014 22:52, Stefan Weil ha scritto:
>>> Newer versions of gcc report a warning (or an error with -Werror) when
>>> compiler option -Wclobbered (or -Wextra) is active:
>>>
>>> util/oslib-posix.c:372:12: error:
>>>  variable ‘hpagesize’ might be clobbered by ‘longjmp’ or ‘vfork’
>>> [-Werror=clobbered]
>>>
>>> The rewritten code fixes this warning: variable 'hpagesize' is now set
>>> and
>>> used in a block without any call of sigsetjmp or similar functions.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
>
> Ping? Maybe this patch can be committed directly as a build fix for
> people like me who use compiler flag -Wextra.

Ok, I'll pick it up.

Paolo



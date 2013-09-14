Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKnSw-0007tD-Df
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 06:52:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKnSn-0007pQ-Hg
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 06:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKnSa-0001jt-D0
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 06:52:29 -0400
Received: from mail-we0-f174.google.com ([74.125.82.174]:57401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VKnSa-0001fF-6o
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 06:52:16 -0400
Received: by mail-we0-f174.google.com with SMTP id q58so2061410wes.33
	for <qemu-trivial@nongnu.org>; Sat, 14 Sep 2013 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=18X2FVgoFfrV9uXbmJCZklabSX1MIeEnvelef8qBi2g=;
	b=WDOHkahtR7UWkS9Y5Gp0Ri2KMqPzKBIEowZ/oa2BM1lK14u6VJQmmlTrG5Jc315xFU
	lQgvxFxuJSp+Kotu346GVzMHrdUSgAiDF2fz+woziBbxEdlwVcSTU0bknJ87VkqfAFpy
	4cOjy8J/jkqSY8L0WsReIl2IzPBSIrgqBbqBqCDhYL7fLrEuH1Xgo5xlOpFrRaS59cjJ
	IL+5IhpvH2UTx2/j8nIdDDJwa9+n6tLgsG8b7RlNl+P7N6UY67323d41BW4QQFnfSi8g
	ci8YpK7vIi6RZqt3bUzTFXPFeibJwHUMhoiEvFY9Hqnqawrs2cnTiaUPjQa9tiQAUrR1
	nCWQ==
X-Gm-Message-State: ALoCoQkqihPhpTP/8Knagi2oo2z1W6KhvZwLx5ksrkmJeBdaIpLTy7XWY0zSnD/UNU+b0+XJXpe5
X-Received: by 10.180.72.226 with SMTP id g2mr5995390wiv.52.1379155934326;
	Sat, 14 Sep 2013 03:52:14 -0700 (PDT)
Received: from [192.168.0.11] ([81.56.67.82])
	by mx.google.com with ESMTPSA id e5sm9274055wiy.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 03:52:13 -0700 (PDT)
Message-ID: <52343FC3.4010208@6wind.com>
Date: Sat, 14 Sep 2013 12:51:47 +0200
From: Damien Millescamps <damien.millescamps@6wind.com>
Organization: 6WIND S.A.
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1379010228-15324-1-git-send-email-damien.millescamps@6wind.com>
	<52342E0E.3010700@msgid.tls.msk.ru>
In-Reply-To: <52342E0E.3010700@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.174
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ivshmem: allow the sharing of hugepages
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
X-List-Received-Date: Sat, 14 Sep 2013 10:52:37 -0000

On 09/14/2013 11:36 AM, Michael Tokarev wrote:
> That to say, this is not a _definition_ of a shared memory object, it
> is just
> a suggested name syntax, suggested purely for portability.  In other
> words,
> there may be other acceptable syntaxes for it.

You are right, the definition can be found in shm_open(P), and reads:
 
  If name does not begin with the slash character, the effect is
implementation-defined.
  The interpretation of slash characters other  than  the leading slash
character in name
  is implementation-defined.

The "implementation-defined" found in glibc is as follow:

The leading '/', if present, is removed. and '/dev/shm/' is prepended to
the resulting name before calling open().
(found in sysdeps/posix/shm_open.c around line 57 depending on the version).

Note that a workaround in my case is to give a name in the form:
/../../path/to/file" ...

> So as the result, I'm not sure this approach is valid.  Maybe we should
> always try shared first and create-new second?  I dunno.

This is probably a better approach, yes. cf next paragraph.

> Note that whole thing - using shared memory object like this - may lead
> to surprizes at least, -- users who previously expected one behavour now
> see different behavour.  Most likely the old behavour wasn't correct.

By first trying to open with shm_open, and only when it fails with open,
the behavior should stay the same. Because according to glibc
implementation, if "folder" exists in /dev/shm, a name like
"/folder/shared_mem" should work, but will trigger a false positive with
the checks I added.
Note that I am not sure anyone uses this syntax, but still, this is a
false positive. I'll change that.

> At least this should be documented somewhere in user-visible part of
> ivshmem, so users will have an ides when objects will be shared and
> when truncated.

I will add a paragraph in docs/specs/ivshmem_device_spec.txt for that.
Thanks for mentioning it.

> It is a somewhat minor nitpick, but it'd be not nice to spread such tests
> (for NULLness) where the object can't be NULL and to confuse readers.

agreed.

> Thanks,

Thanks for your review, that was helpful. I'll send a reworked patch,
probably on Monday.

-- 
Damien Millescamps



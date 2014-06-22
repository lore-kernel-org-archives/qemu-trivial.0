Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyX8O-0002OO-Ek
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 22:03:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyX8E-0002CK-16
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 22:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WyX84-0006lU-VW
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 22:03:45 -0400
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:50731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WyX7m-0006IO-IF; Sat, 21 Jun 2014 22:03:18 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so4482094pab.1
	for <multiple recipients>; Sat, 21 Jun 2014 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UryAM10dVPMjpj+3B9zG35xrJ05dqrdpqUHXjtxsAG8=;
	b=dSZPJy960ncX3ku67/StK1mFlKYR9Iqq40uj7/gM7Pa2EPP/aasKTc9JHUu1TYmKW9
	4irdKSj313CvN5QMRs+MIUIGKmctGKcwMHVmbYigdlWjBNYUF852iQUkgdyE4y9QwTHP
	bLWdl6q/XwndazRFOq3mayGBLxP9OMyPvfPBaozzP+jCdGUQNSlR8uoV3ubxrshCyFbG
	jcS3GNCVcQazvHbgd6Rl9NuUVq/Kk8Sa1hsKR9VRmmb/Lm8l2jov0vyoapXvhKAvRhgV
	sOe/fcLNDTi6/vp3W6fhBZNkXoC+GWzH78A3KDbqdcjfidkiKn08ATUbiIr2U15uR3dT
	Xg/Q==
X-Received: by 10.68.102.34 with SMTP id fl2mr17012071pbb.2.1403402597168;
	Sat, 21 Jun 2014 19:03:17 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	vs10sm20096410pbc.38.2014.06.21.19.03.04 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 21 Jun 2014 19:03:16 -0700 (PDT)
Message-ID: <53A63955.8090601@gmail.com>
Date: Sun, 22 Jun 2014 10:03:01 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, kwolf@redhat.com, 
 stefanha@redhat.com
References: <53A581FC.6050305@gmail.com> <53A59EB9.4020208@msgid.tls.msk.ru>
In-Reply-To: <53A59EB9.4020208@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] block.c: Remove useless 'buf'
	variable
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
X-List-Received-Date: Sun, 22 Jun 2014 02:03:55 -0000


On 06/21/2014 11:03 PM, Michael Tokarev wrote:
> 21.06.2014 17:00, Chen Gang wrote:
>> 'buf' is not used actually, so remove it and related snprintf() statement.
> 
> Applied to -trivial, after removing wrong reference to dtc submodule removal.
> Please don't include these in diffs.
> 

OK, thanks, I shall notice about it, next time.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed


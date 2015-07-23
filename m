Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZI9Bx-0001uD-8U
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2015 01:37:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZI9Bv-0001s2-Eu
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 01:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZI9Bu-0002OJ-L5
	for qemu-trivial@nongnu.org; Thu, 23 Jul 2015 01:37:11 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:36157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZI9Bq-0002NM-L4; Thu, 23 Jul 2015 01:37:06 -0400
Received: by wicgb10 with SMTP id gb10so126471813wic.1;
	Wed, 22 Jul 2015 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=lR9cg3MmhywDMfdvVqIiaJeG1YudCov/QAhoDAnjku4=;
	b=C5kgCsAUsC3+bZ5l1Dm0Pb0gVVZEx3BZHa6tjwKbsO/6GnQOe7IS5xzhohFDf3w+k6
	IBwFi1WJ8bm+idIVrkW3/CP6JEbhEF56EmFvAL6wE7ZvJ3Rzcy1m1+1WYUp/m9bKjDH+
	11k6cDBWUegOu84skwTfBkOFRqIXcG/MbX2zxeE0gpovT3Blo1kNDnpe6aHXkBJNovkV
	1k1QylyRZrKF8Ez/cIbF66cbnlzEPXisFRwjzMALZr5+jbnab2OMN7ooIXKWyhfWP7nz
	rejMlO5NXK8rVGxwoQKU0qygrLCc0S1njcdyzdC6BertoJUmTJgKrAcmTjuedKwA/izj
	SbIw==
X-Received: by 10.194.5.74 with SMTP id q10mr11830990wjq.27.1437629825998;
	Wed, 22 Jul 2015 22:37:05 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-188-187.clienti.tiscali.it.
	[94.39.188.187]) by smtp.googlemail.com with ESMTPSA id
	k4sm6674193wix.19.2015.07.22.22.37.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 22:37:05 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Wen Congyang <wency@cn.fujitsu.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
References: <1437587610-26433-1-git-send-email-sw@weilnetz.de>
	<55B046DA.6040308@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55B07D80.5070607@redhat.com>
Date: Thu, 23 Jul 2015 07:37:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <55B046DA.6040308@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for-2.4] vl: Fix compiler warning for
	builds without VLC
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
X-List-Received-Date: Thu, 23 Jul 2015 05:37:12 -0000



On 23/07/2015 03:43, Wen Congyang wrote:
> On 07/23/2015 01:53 AM, Stefan Weil wrote:
>> > This regression was caused by commit 70b94331.
> vnc, not vlc in the title.
> 
> Reviewed-by: Wen Congyang <wency@cn.fujitsu.com>
> 

Thanks, queued for 2.4.

Paolo


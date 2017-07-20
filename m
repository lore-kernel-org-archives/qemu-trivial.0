Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYGug-0000pC-2j
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 15:15:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYGud-0000m9-A6
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 15:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dYGuc-0000PP-Bj
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 15:15:03 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dYGuW-0000Jf-74; Thu, 20 Jul 2017 15:14:56 -0400
Received: by mail-qt0-x242.google.com with SMTP id h47so4571466qta.5;
	Thu, 20 Jul 2017 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jZaR4GIZCWho5XOYOvITKiXn3VgHePG7INZHNOqMLec=;
	b=XzS4aPnZeOlCweFrbeXdRhdErRKnFtYoIM+v8407XKHPb9+Kf92OiP2+mIb8aoQitw
	SyFIj6hryRnaq2immgRnRdQCCrMbnCQGYHTygTI4Eyqq1wmfcsTsiLYq1OF2whxTJpXX
	ESQhyYzyVv7/jeIx9pKPE+ZVjKpZA4u9/wVPxpMfUiMVL2dsUD6EFXAhOoMEZ9lZQSGh
	ddCtml2ja6dWsjQ1Y5/LboVYFlzbQrGOokfFoVzAYygR/ewta+j7K3uXCpuZplMg3HcP
	8gGYwyGbmNS9v53ieE92UzvJmaX8p+NzreUg+NewkcrUEnu0iksSIi1xBUtHcQOaJyfj
	VB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jZaR4GIZCWho5XOYOvITKiXn3VgHePG7INZHNOqMLec=;
	b=gaSPM91zRxWtj43SdEeMe1Ikf2wzeI5mkd/Dl+/XgnSlfz61HvKRx027eEDzHonpT9
	WNM8ckoQtXmk4LNFkNC54AHonvv6+b3gBcFloUcxq7Un1nj9ygcMG8tksOOj7MIPJZkT
	vAHg4GEz4BzI3zcL8DJQmQuhAt5/659n6YwHI1AlGhybr+TY3Xm9dtHnoE/NIVSzwQnZ
	WTJy4eOeM3PGoZmCCJutldQcGxdL/LFy3FwuHaWHgJ+U5XA2UVMmZvZHo6sAA8AEsAKx
	GHTyyK0yhev3xSdEXBcSkspWsygIJNMJaRZEPPGCS+GzssKMEFBDjN9LKGMbYP53sGRV
	RACQ==
X-Gm-Message-State: AIVw11320HJpBmtXaGDhsnOtjnJ938MtbCJFkoSSKmH99a3qVGlIW/X/
	er4ySfJ9ZZeOrg==
X-Received: by 10.200.8.106 with SMTP id x39mr6731437qth.309.1500578095654;
	Thu, 20 Jul 2017 12:14:55 -0700 (PDT)
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
	by smtp.googlemail.com with ESMTPSA id
	w46sm2312940qtw.28.2017.07.20.12.14.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 12:14:54 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
	<d4b6f6a0-3479-795a-97b2-68c98a6b0c24@twiddle.net>
	<c1526558-db87-734b-c1dd-7601ceaa682c@redhat.com>
	<06919388-6794-d0a0-f014-b95a9cc68460@twiddle.net>
	<10223971-6e02-fe3f-337f-de9c14081582@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <196b152f-6bc9-fcef-4fcb-27cb9acf4a25@twiddle.net>
Date: Thu, 20 Jul 2017 09:14:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <10223971-6e02-fe3f-337f-de9c14081582@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 19:15:04 -0000

On 07/20/2017 09:04 AM, Eric Blake wrote:
> And I found this in C11:
> 
> 7.4 Character handling <ctype.h>
> 1 The header <ctype.h> declares several functions useful for classifying
> and mapping
> characters. 198) In all cases the argument is an int, the value of which
> shall be
> representable as an unsigned char or shall equal the value of the macro
> EOF. If the
> argument has any other value, the behavior is undefined.


Thanks.  I should have looked up there.


r~


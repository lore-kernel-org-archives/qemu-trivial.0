Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ay1II-0001Iq-3g
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 14:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ay1I9-0000y0-4I
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 14:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ay1Hq-00074A-1D
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 14:12:51 -0400
Received: from mail-qg0-x244.google.com ([2607:f8b0:400d:c04::244]:36692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ay1Ho-0006wC-RV; Wed, 04 May 2016 14:12:37 -0400
Received: by mail-qg0-x244.google.com with SMTP id f74so3520991qge.3;
	Wed, 04 May 2016 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5Gg1NU5CIMVN/pe3VJKkOA1fMTQxWsXWqQKDEFcthpQ=;
	b=cagDofhaXHnM9He+24bxiwr84ozpJvqKWG4Ycpn6ZyiA7G2Xebyolr7amCB+z8Sq1m
	1KwSMZWic1MZu6+59aGNGc8Zkj380xkyhb+JIIUyDhfiS5TjP0e4G82EvZfuimP7QOHL
	isQlM6jnn1IKRwoRaRHEaUcLC8wT4FEkZgnuwX6vweyP8/CWxzsNEV4/Z4scs70zAVc9
	UJW7vL5V5OUSIEo/BtfVOGHHPFULw/1X0aMo7ZxTd2TKRDxAVg9UwcbISfbZpUTLAPDh
	jlUCEYacFurdUvPGbqvgk8cGKh7QqyIpPStjkPeCO7eiV9eULtQ8jsQqrWHkzN2caryh
	pFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5Gg1NU5CIMVN/pe3VJKkOA1fMTQxWsXWqQKDEFcthpQ=;
	b=Rc0Ve2904OlR+77Kk833TSVjxMV9iCiisD01iH56MhrYLtjRH3pMV89st3BLc4jsQk
	AcCcj+KFO4QuTtuPn8hgpD6BGXLaj5PjjQE6fxBMSKQgT1OY8H0wx03grmS9gpt7xOgO
	v83A9Rm1TTk4fP2InCwsNb9/enCoHrGvcRztBxMGEK5ts7zVVwQ+i9ViT64ztJm8DESb
	iYLVXBXvrXp+eZ9RvrFRx2oR85RZSc9KnPo2i8PFbJHSfD5/HY/eyYpzTGJU54THtUVJ
	3WWP5Fh9zghOHoYp2qNI6ifvGuQRqyUlvi2GX9D/bqjw9eok/6VfCvjdzEG0cWU2Ktc3
	h5Fg==
X-Gm-Message-State: AOPr4FVbvvg/KX+lWMaNbxWa36s01FRbl1XqbG8mJdLbISDQprkjrKCgLc4owHxwF2BGmg==
X-Received: by 10.140.107.11 with SMTP id g11mr9776565qgf.52.1462385525348;
	Wed, 04 May 2016 11:12:05 -0700 (PDT)
Received: from bigtime.twiddle.net ([172.56.44.168])
	by smtp.googlemail.com with ESMTPSA id
	u103sm1753807qge.24.2016.05.04.11.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2016 11:12:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ba67b821-548a-8d13-fed0-3567fb9836f6@twiddle.net>
Date: Wed, 4 May 2016 08:12:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1462367048-20997-1-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] muldiv64() trivial fixes
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
X-List-Received-Date: Wed, 04 May 2016 18:13:04 -0000

On 05/04/2016 03:04 AM, Laurent Vivier wrote:
> Some fixes in the use of muldiv64()
>
> The patches have been generated with the help of coccinelle.
>
> The first patch contains the scripts used to generate the two following
> patches. As it is done for linux, I've added the scripts under
> scripts/coccinelle.
>
> Laurent Vivier (3):
>   scripts: add muldiv64() checking coccinelle scripts
>   The only 64bit parameter of muldiv64() is the first one.
>   remove useless muldiv64()

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


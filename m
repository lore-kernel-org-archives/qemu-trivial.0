Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpk7D-0002yX-9l
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 18:47:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1bpk7B-0002vD-Fc
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 18:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1bpk77-0000Y1-BW
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 18:47:40 -0400
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243]:36541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1bpk77-0000Xp-2c; Thu, 29 Sep 2016 18:47:37 -0400
Received: by mail-pa0-x243.google.com with SMTP id cd13so2116331pac.3;
	Thu, 29 Sep 2016 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xladNDpF3MWwy2NYFc11Yncnq3TNhKEcs7/4g8prG9Y=;
	b=iEVO6oXHY+AWZ+IjkSZCmlF94kZN6XVzhR6MX8PYn2Yl582uIlRiNgtNQmAOGVqG9H
	IxGhEww9TD0LUmQRny7mupEB03+WTnNmuSehOrV2CXmjoM9lewU4PYnOFPXtf6p5EfZ/
	7vyIh+wsThNqwuE9uJhbn4di2fSX1GtozaefTbY4MCDwLr4ifZnLL+LuxFn3CtgKtj0F
	AokaDqBREu8kvH+0wUodynFhsQa7ZCi8RAKeqhZIJ5l9e7+kVtmNbDZmcsdb8cdoTDH1
	zemdcUgL77IzaHymFGKKsmUs/V/B3YPFNcmNCc1SS97jE/P5Cm2jso6qCcN5jrIyonGK
	7Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xladNDpF3MWwy2NYFc11Yncnq3TNhKEcs7/4g8prG9Y=;
	b=iThiOazowQIOujYUbapbfHam5mYiohm+Xa17mgb6C5hiaESQJxxMI3PyTgClUiOyeJ
	qUkL3VsLw6jLw9JyVrUMB1cL18aAAhTpD8S50yWYsj71FtP2eX0zKpPesCRWOay/NGMC
	akqiu8N188jPJlrjfMutT0zqONw5C2tZuAaxVwQhYL8lRJ8hbC5FjbHde695APikh4EK
	5OiW1f+zLPIEYV2y25PjjY+Y2sMR7tYlFf3cVoBbb0Dmcq8AuFbvY1ZrHu4/ZbzXAvZ8
	Vlh+tJfqhQRyL68E56Ex1qNHCHyr9mKFIICkDkWkcc5twL1ZW1hk3XVoqE+W40QSyspr
	q7Lw==
X-Gm-Message-State: AA6/9RnLSCEahprkzqA+v9IHniyIvBZpySgGm0UJbt+xbt7g+4TWcuHYdQZtwwYK6MI4LA==
X-Received: by 10.66.127.7 with SMTP id nc7mr6470025pab.107.1475189255547;
	Thu, 29 Sep 2016 15:47:35 -0700 (PDT)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	e1sm22689331pap.11.2016.09.29.15.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Sep 2016 15:47:35 -0700 (PDT)
Date: Thu, 29 Sep 2016 22:47:33 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Wei Yang <richard.weiyang@gmail.com>, corentincj@iksaif.net,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160929224733.GA25897@vultr.guest>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <1457185628-23304-1-git-send-email-richard.weiyang@gmail.com>
	<e0efac7a-8b69-2ae7-efea-b2bdf6676459@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0efac7a-8b69-2ae7-efea-b2bdf6676459@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::243
Subject: Re: [Qemu-trivial] [PATCH] bitmap: refine and move
 BITMAP_{FIRST/LAST}_WORD_MASK
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
X-List-Received-Date: Thu, 29 Sep 2016 22:47:42 -0000

On Thu, Sep 29, 2016 at 07:11:39PM +0300, Michael Tokarev wrote:
>05.03.2016 16:47, Wei Yang wrote:
>>According to linux kernel commit <89c1e79eb30> ("linux/bitmap.h: improve
>>BITMAP_{LAST,FIRST}_WORD_MASK"), these two macro could be improved.
>>
>>This patch takes this change and also move them all in header file.
>
>Applied to -trivial, thank you!
>

Thanks :-) Have a good day~

>/mjt

-- 
Wei Yang
Help you, Help me


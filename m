Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aR2K3-0000dF-53
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 13:38:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2K1-0000aM-00
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:38:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Jx-00042h-Re
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:38:32 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Jx-00042D-FW
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:38:29 -0500
Received: by mail-wm0-x22c.google.com with SMTP id l66so83982048wml.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=Pr8zj3Um0ejt2xNMXUqjRM0n9BnsX0XIp8Elo5xiWU4=;
	b=d2bEIOr/OMywrNKi1oXzgZcyiuzmzri44YhKf+wAFDMajt/M7Ze5ToyiVw5IU9mw0Y
	hDDwvHG1v36D2Gv0OedtTUcPnDAPZCOsjhRxQ3ayYIjMS8Gd3yBS6AFrxsYROYueycuC
	PJpFTlu07TEDxsUrTIK4RfY8tSGrcGQgjNs1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Pr8zj3Um0ejt2xNMXUqjRM0n9BnsX0XIp8Elo5xiWU4=;
	b=QYzqOB+SxyzaP1cHJxZWtht8pKs43u395m1N/Au651SvfDnQTZo01Nk+uBCyJjmcex
	sn574yXdtLFZTZDD7YtetTNGJzXN3Glv7ESO8mqBAo4sep1CefXfPxwbImchV6pPgtny
	HYGNVas4+DR3UoA54daQ2/3nFSf+EmorzniqlxtuB4osJaw0mggBUibfdew0LL6gD8iR
	w4F3o9KuVO6MvO21YZw/6WeOxGaVLw7w7TeDOsiRzdiET/xj1BP/top0DCLG4hyjt1Wg
	ZyV4KfwWLxEpZguZ3QUmLvq2e3pPvrsALX1C5XqUW5k5jXKFVPdDutjSeaqz83bY+R4Q
	9pFg==
X-Gm-Message-State: AG10YOQE5tdrO9NkOiy3E6hmryDYS/dChphJpqY4YoaJme0PvNvEv0lT3I+lP5I6S2ETC2aa
X-Received: by 10.28.11.73 with SMTP id 70mr5536074wml.40.1454524707102;
	Wed, 03 Feb 2016 10:38:27 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	hm9sm7724737wjb.34.2016.02.03.10.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 10:38:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BDC103E01B2;
	Wed,  3 Feb 2016 18:38:24 +0000 (GMT)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-3-git-send-email-alex.bennee@linaro.org>
	<20150804123628.GA6780@aurel32.net>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
In-reply-to: <20150804123628.GA6780@aurel32.net>
Date: Wed, 03 Feb 2016 18:38:24 +0000
Message-ID: <871t8tprkv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 02/11] tcg: light re-factor and pass
	down TranslationBlock
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
X-List-Received-Date: Wed, 03 Feb 2016 18:38:34 -0000


Aurelien Jarno <aurelien@aurel32.net> writes:

> On 2015-08-03 10:14, Alex Bennée wrote:
>> My later debugging patches need access to the origin PC. At the same
>> time we have a slightly clumsy pass-by-reference access to the size of
>> the translated block again for debugging purposes.
<snip>
>>      void *tc_ptr;    /* pointer to the translated code */
>> +    uint32_t tc_size;/* size of translated code */
>>      /* next matching tb for physical address. */
>>      struct TranslationBlock *phys_hash_next;
>>      /* first and second physical page containing code. The lower bit
>
> What's the impact on the memory here? Given the alignement, we add 8
> bytes to the structure on a 64-bit host.
<snip>

Well this has all got a lot simpler thanks to Richard's clean-up work
since this was last posted.

--
Alex Bennée


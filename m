Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpWW8-0001RT-D7
	for mharc-qemu-trivial@gnu.org; Wed, 16 Dec 2020 08:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpWW6-0001RB-UW
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 08:06:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpWVq-0001CM-5u
 for qemu-trivial@nongnu.org; Wed, 16 Dec 2020 08:06:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y17so23096315wrr.10
 for <qemu-trivial@nongnu.org>; Wed, 16 Dec 2020 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=ZHFjOYnTgRPTMW3Msy/H/FXvPi/OGwNFmDtAxWJIlGE=;
 b=AWOU4eSSMC5YmmBc5XCX8JakIWKqUKW8mxkAlvDiuiS7hTmT1fDf/LWwANB7LV5LI4
 rhgB0Zfr5fQnyCNa+clUd10n5XzS5H0royl8CTXMJL7CRw59m7nnvLft7Fqx84b6q6Zi
 JqK797RgCL13anrIVD68rZ13c1iP3qf8p6ywmECSGWRkblGVDBnEKTVRxAAnLmlHwC4x
 5lUjYEwuAoIOS2XsNgDFT0Ie3spvCZkw3RI2XwNbrJJiXk3Rt9OBwjj3V5aIyvkOKkjU
 dS24MNqQJBgESaoTFKYeGC1VY7UZQH/YFJvHF3q2uw8LkufpH0Wm4NpQ7V1fgWs5OQ/8
 OheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=ZHFjOYnTgRPTMW3Msy/H/FXvPi/OGwNFmDtAxWJIlGE=;
 b=BdKXYlKoOC6gJxK8Q8VsKX19yFRmhGTLrgujqaQJLCtXAz/xv0G2O+6IJ5Lia/w6F6
 mTd33vkmp3bDqriCaFfaJCLhymLwMuvwQ2vrICISX2QTkGKcAJgbf1EaMSKbaNCj4+YN
 v5ni/iUxxGI4sSMemmPXh8dzUhO8phRCZXIJE2lWcHrapI3h5AZzmepJvT+w/5Z1VMf8
 kLL/9jNQ7Mq2YOEvY4tC2pI83PmcnL0vOW/QDlImoe+9L2NvAKqOQ9V3t82CjyCgSFtA
 oT7xwkZ5uKm1IMcdjRE/cxYiPLNaUrh1gW99zwUg+9tSa9kWkKWB/x2wjKHFHQ3i0L5T
 Mi7Q==
X-Gm-Message-State: AOAM531ImzJwPFvJzlxrXVyhnJtwNfXO1aVAk2Nvama7HV6P2uuR/Mns
 wWegIGuxskCBEDix9qrAZ9hEjA==
X-Google-Smtp-Source: ABdhPJzQyv6gx6k2x05PYHCG05vCQ4O0VSgMvrEFp5ppxhvH4a80OlZKdzjOrdfVINEECQVPjFNnyg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr33346493wrh.41.1608123996430; 
 Wed, 16 Dec 2020 05:06:36 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id s12sm2612369wmh.29.2020.12.16.05.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:06:35 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 16b0cef3;
 Wed, 16 Dec 2020 13:06:34 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] block: report errno when flock fcntl fails
In-Reply-To: <20201216115746.GC7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
 <20201216115746.GC7548@merkur.fritz.box>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 16 Dec 2020 13:06:34 +0000
Message-ID: <cuntusluch1.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::42e;
 envelope-from=dme@dme.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Dec 2020 13:06:55 -0000

On Wednesday, 2020-12-16 at 12:57:46 +01, Kevin Wolf wrote:

> Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
>> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
>> 
>> > Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
>> >> When a call to fcntl(2) for the purpose of manipulating file locks
>> >> fails, report the error returned by fcntl.
>> >> 
>> >> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> >
>> > Is appending "Resource temporarily unavailable" in the common case (a
>> > file locked by another process) actually an improvement for the message
>> > or more confusing? It would be good to mention the motivation for the
>> > change in the commit message.
>> 
>> Distinguishing between the common case and others is at least a start
>> when trying to figure out why it failed. We have potentially useful
>> information to assist in diagnosis, why throw it away?
>
> I agree in principle, just when I saw the result, it felt more confusing
> than helpful. Maybe the best option would be to include the errno only
> if it's different from EAGAIN? Then the qemu-iotests reference output
> would probably stay unchanged, too.

This is a pretty low-level error report even today - unless you
understand the implementation then it doesn't shout "the file is being
shared".

Given that, I don't see any value in eliding the EAGAIN message, as I
have to know that the lack of the errno string means that it was EAGAIN,
meaning that another process holds a lock.

>> In the case I encountered the failure appears to have been caused by
>> SELinux misconfiguration.
>
> Ah, so you got EPERM?

Yes.

> It can useful information in the future, let's include it in the commit
> message.

Okay.

dme.
-- 
My girl Friday, she no square.


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xydwf-00054h-NB
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:52:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydwU-000530-K3
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydwL-0007RV-JU
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:52:22 -0500
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e]:37744)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XydwL-0007RF-Bx; Wed, 10 Dec 2014 04:52:13 -0500
Received: by mail-wg0-f46.google.com with SMTP id x13so3101111wgg.19
	for <multiple recipients>; Wed, 10 Dec 2014 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=nRq7AQZ5jR9EpzfD/EehZGVaSGJ2SnjMNbcmeRvhzvU=;
	b=tGrbdLG+LdyHMCmZ4XtFAPzYiKiGINXlrpO+Mt7WJfr85U3NdD2i+ikxbCWvCU10e4
	npK9nC5xQuAVy6FU8xEZKPsrea4CwPuHkoWiTqEp0B8bjY7P712XkFcuIP0fMht8jNIR
	m6yPEJWCY5UXlABe1MlSnLmw/sr7+/J1VOsFXql/6CiqLBt47jVuhrKw6J7sIffXVr6t
	6Gsh5G4o6AxzX4U3ylE0mLGoFjM43QSieGg40Vk1iHweGxaXvNbOjfvzl2+dPmwfdUsC
	Tb29kX/PIlT3fJ7faEfvXKREOAKKCO7lUynhznPIwBoAfcIdsPHrtvqq4OBeZnxw1afS
	klXw==
X-Received: by 10.180.73.235 with SMTP id o11mr4714940wiv.51.1418205132618;
	Wed, 10 Dec 2014 01:52:12 -0800 (PST)
Received: from [192.168.10.150] (net-2-35-193-40.cust.vodafonedsl.it.
	[2.35.193.40])
	by mx.google.com with ESMTPSA id p5sm17227527wix.7.2014.12.10.01.52.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 01:52:11 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <548817C7.5060404@redhat.com>
Date: Wed, 10 Dec 2014 10:52:07 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-devel@nongnu.org
References: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
	<548812E5.6040809@huawei.com>
In-Reply-To: <548812E5.6040809@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22e
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Wed, 10 Dec 2014 09:52:31 -0000



On 10/12/2014 10:31, zhanghailiang wrote:
> Hi paolo,
> 
> Will this change affects the migration?
> I noticed that there is a member 'SuperIOConfig superio_conf' in
> VT82C686BState.
> 
> vt82c686 seems only to be used in mips64el target, Do we support
> migration for mips target?

No, there is no VMState for superio_conf.

Paolo


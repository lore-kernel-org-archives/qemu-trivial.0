Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vz11v-00067V-Up
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jan 2014 04:26:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vz11n-00066u-4q
	for qemu-trivial@nongnu.org; Fri, 03 Jan 2014 04:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Vz11f-0007vR-K4
	for qemu-trivial@nongnu.org; Fri, 03 Jan 2014 04:26:51 -0500
Received: from mail-ee0-f47.google.com ([74.125.83.47]:50945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Vz11f-0007st-EE; Fri, 03 Jan 2014 04:26:43 -0500
Received: by mail-ee0-f47.google.com with SMTP id e51so5607481eek.6
	for <multiple recipients>; Fri, 03 Jan 2014 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ocQ6RWZGOQfYy+UuVuUMMHw/T189Cxw9h9ZFwLQvTCE=;
	b=NuqDMNAF83EF4R31Hcnhfk3o4KuPKKbztgq4tXgYurpY0HkcJ2T+2JTXQi22jpZV+d
	imVLWq3d7TWb45/ofj37GESi+Dfwu+fGxOzGmqEKuY4X6J0hYZcT7SGLwqVWXxrWqo7y
	eHrQYDg+sHPFOKqndEp3aWlG5mSnEpHKDjvEMnzxI2+5LppbXzgnhHAEFHJ3ZvO57cF0
	odhmvw2ql3jBujM27p6hHsYteNdFeLNOo9KAhzG+xZIIZ8RY+n2/Zf0v9K9WlNkCt+X8
	3UZGRm8ag+92qXY+/JW/qYpfEls7RJIHO4citDRr8FoDRpTq5tSEubGKETgiXozOIqPZ
	LCOg==
X-Received: by 10.14.0.201 with SMTP id 49mr20409002eeb.38.1388741167140;
	Fri, 03 Jan 2014 01:26:07 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-131-111.cust.dsl.vodafone.it. [37.117.131.111])
	by mx.google.com with ESMTPSA id
	h3sm143296183eem.15.2014.01.03.01.26.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 03 Jan 2014 01:26:04 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52C6822D.7090707@redhat.com>
Date: Fri, 03 Jan 2014 10:26:05 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
	<52C5203F.1030408@redhat.com> <52C57BA5.101@suse.de>
In-Reply-To: <52C57BA5.101@suse.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.47
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] qtest: Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Fri, 03 Jan 2014 09:26:58 -0000

Il 02/01/2014 15:45, Andreas Färber ha scritto:
>>> >>  v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/libqtest.c).
>> > 
>> > What happens if qtest instead uses "-display none"?
> It does use that, since the commit I pointed to in v1. :)

And why do you need at all "-vnc none" if it also uses "-display none"?

Paolo


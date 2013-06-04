Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ujy8d-0000CW-0a
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:47:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ujy8b-0000AQ-9G
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Ujy8a-0004vW-4z
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:47:24 -0400
Received: from mail-qe0-f42.google.com ([209.85.128.42]:38872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Ujy8W-0004mX-6A; Tue, 04 Jun 2013 16:47:20 -0400
Received: by mail-qe0-f42.google.com with SMTP id s14so545535qeb.29
	for <multiple recipients>; Tue, 04 Jun 2013 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=/hCN3igWVjzusVOCHXpMJ5DuCGGlPKAvqD48YzAm9Nk=;
	b=uuHJsZrSSq3aKwmyNLizMhbHTKEQc9HPQKeP+8Vheoi/7HGLnxH/HQQ25gBtwNGxLu
	D61PSemYZxt1I8TR19nuG2bJ7IGN5czDvjtldFhXVzdjV7Xdbjy/zrp5KLYuwpnEslw8
	hYLtGBWw6rf0uuX6LJpwilzqLjOc0ZycmZZGb6f+7JfbLxCNowJJzyxh9aDxaK5m7lyt
	IhRAkx8gH2wZSggN47F8uFdRCegCWMPTDFTY9VcwM/+4Xk+y4NMOZ0ynpNW3cTeJpkwZ
	tZFZtyu+Drs9ZYUQuZRvsdpxKJc4G9JtV9ij+tNvvhJxeiMyXeC6aea/g0qpg0wuEvAf
	zTIQ==
X-Received: by 10.224.198.194 with SMTP id ep2mr24602945qab.51.1370378839745; 
	Tue, 04 Jun 2013 13:47:19 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id c10sm56935800qag.2.2013.06.04.13.47.17
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 13:47:18 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51AE5249.3060401@redhat.com>
Date: Tue, 04 Jun 2013 22:47:05 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alon Levy <alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-2-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-2-git-send-email-alevy@redhat.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.42
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:47:26 -0000

Il 04/06/2013 22:23, Alon Levy ha scritto:
> This fixes six instances of unchecked fcntl return status, spotted by
> Coverity.

I think we're just assuming that they cannot fail...  I don't think we
need the previous patch and this one, unless they help porting stuff to
Windows.

Paolo


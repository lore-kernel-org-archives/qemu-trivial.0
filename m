Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQDRE-0002Cj-LC
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 02:55:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QQDRC-0002CW-9S
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 02:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QQDRB-0003S8-LD
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 02:55:54 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:47716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1QQDRB-0003S4-GP; Sat, 28 May 2011 02:55:53 -0400
Received: by wwj40 with SMTP id 40so2250810wwj.10
	for <multiple recipients>; Fri, 27 May 2011 23:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:message-id:date:from:user-agent
	:mime-version:newsgroups:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=lnzgsV7ALvEHCS9WYn5PG3aiqsD6Une48FYhgI/9Z2U=;
	b=LEM2tQ1zS6V2tW8zbSDGkxq2bDjrQkSUFAsyIFNgDONx2+ucbSs9mzoHiX07BT7Rpm
	iy3g+rnbPgdpqTH22/bAJbANQa4o3lSiiF2QeYsXykyUZeroKaA9e8nxmqW7AHqXWMxN
	jWYhKIcv4cSFIPXrkjxsq5xPTPCpwnYEyXpzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	b=nRHib/FMTwOEHbItSRj9but8gWNXzmGJZCidf9IIJGQsABuVk/W4RGa7a4lrdduI1z
	72H1dgwkbMMj8Vbb4guVsSZsq11QtFez/EE7ovimzsbhlo4GVHIV05ffgVhZUUk3gMc7
	w97gMrtyiCRJCzYh6DigDZpkVj0QBzRClHNYg=
Received: by 10.227.128.20 with SMTP id i20mr1225650wbs.3.1306565752438;
	Fri, 27 May 2011 23:55:52 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-184-88.ip51.fastwebnet.it
	[93.34.184.88])
	by mx.google.com with ESMTPS id m8sm1660832wbh.11.2011.05.27.23.55.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 23:55:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4DE09C75.30906@redhat.com>
Date: Sat, 28 May 2011 08:55:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Mnenhy/0.8.3 Thunderbird/3.1.10
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Alexandre Raymond <cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>	<1306516951-31105-6-git-send-email-cerbere@gmail.com>	<4DDFE0C9.5040907@mail.berlios.de>	<m38vtst0up.fsf@blackfin.pond.sub.org>	<4DE00D46.5030604@mail.berlios.de>
	<BANLkTi=s7wHQcJHfnN0mGQ0oeeZkKzByng@mail.gmail.com>
In-Reply-To: <BANLkTi=s7wHQcJHfnN0mGQ0oeeZkKzByng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 5/6] Remove warning in printf due to type
	mismatch
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
X-List-Received-Date: Sat, 28 May 2011 06:55:55 -0000

On 05/28/2011 12:10 AM, Alexandre Raymond wrote:
> Hi Stefan and Markus,
>
> Thanks for your feedback :)
>
> "%td" doesn't generate warnings on Linux nor on OSX.

Stefan, what about Windows?

Paolo


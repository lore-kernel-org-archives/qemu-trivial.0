Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TdfBx-00073A-7J
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2012 05:48:33 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TdfBn-0006aN-6h
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2012 05:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TdfBj-0006J1-8H
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2012 05:48:23 -0500
Received: from mail-pb0-f45.google.com ([209.85.160.45]:57699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TdfBc-0006HG-1V; Wed, 28 Nov 2012 05:48:12 -0500
Received: by mail-pb0-f45.google.com with SMTP id mc8so9126870pbc.4
	for <multiple recipients>; Wed, 28 Nov 2012 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=yb+eg5w3CIh2b89Dq9FjdcABbj6GchBjSORvfnTFkBw=;
	b=DYsEgRH+HQByW7BIzZgkpdZUTFbtaEnsuqN8ZVzVGKHcyXQ24yt3QcQEcZDy/nDPiO
	01lw6qgtECzIA4mZcT9ySP1n3GVzWufx/gze2O7mi6KVU+oIvTbdQuP0Bk26oUmW9S0K
	YkxNQajKdMplGCf+FyqI4qDlcP64qB1GehEb9JGhx9uPlKNjOhpCG5UdTpBtNkgTtbvG
	083VyC6AzifdkcMLgVkaBhFYEcPNMo7Mhfh8bkE/q6+Pv72ALE7zQiiDRPxdfa5+bOFX
	n0OitJSKvmpMLXO2gb2qMXmw7hepC0/B0FS+Md9Ed3h5dOEC5DmSdIXb/nbsIPK9qAD1
	JWTA==
Received: by 10.68.253.4 with SMTP id zw4mr57153338pbc.143.1354099690595;
	Wed, 28 Nov 2012 02:48:10 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id ve6sm12269013pbc.58.2012.11.28.02.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 02:48:09 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <50B5EBE3.2070005@redhat.com>
Date: Wed, 28 Nov 2012 11:48:03 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <db00c89dd60757fa9b3be58894e3cbf0fdaa9517.1354099560.git.mprivozn@redhat.com>
In-Reply-To: <db00c89dd60757fa9b3be58894e3cbf0fdaa9517.1354099560.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] nbd-server-add: Fix the default for
	'writable'
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
X-List-Received-Date: Wed, 28 Nov 2012 10:48:31 -0000

Il 28/11/2012 11:46, Michal Privoznik ha scritto:
> The documentation to this monitor command tells, that 'writable'
> argument is optional and defaults to false. However, the code sets
> true as the default. But since some applications may already been
> using this, it's safer to fix the code and not documentation which
> would break those applications.

Thanks, applied to nbd-next branch.

Paolo


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfVey-0002Gg-J4
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 12:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZfVew-0002C8-96
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 12:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZfVev-0006iW-KI
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 12:15:42 -0400
Received: from mail-la0-x235.google.com ([2a00:1450:4010:c03::235]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZfVeq-0006gG-R3; Fri, 25 Sep 2015 12:15:36 -0400
Received: by lacdq2 with SMTP id dq2so48471519lac.1;
	Fri, 25 Sep 2015 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IJfEc+AtI0CHy6M0ymufBcVZMlBH1MVmtc9T/FOarwg=;
	b=NN4PLGmdp8OlsnbwO7cBb4A+1H/32L6F3dAvZUlh0Qhn5TxyZsMMv3+mX5569F9wF9
	/f5J8wGaA7dvvYF70Qp1QR6x8Jt6tGidDU/767BhTAmnMw4LHbFcwlZAI5AWeAIHUthl
	FehHiqmVURFiTUhaCm1o13lSOA1/BGsCWVr7AK0G+Zw8LXpCkVd5B3s+6EVrnBuhinCs
	C67Ji9Nvi8qIYrTB5Kiok1H3YT4qwk+Ke4FHbSDbYdabI4t9mmXT4Jj6rTeDdYZEVmGP
	M0q/JrMSd4OOaqH0ywcItNSNPemPuSFYTFq89Y2nytSvOHea+BKoyKC+9OrhQK5uFOWv
	31jg==
X-Received: by 10.112.133.42 with SMTP id oz10mr1965662lbb.62.1443197735922;
	Fri, 25 Sep 2015 09:15:35 -0700 (PDT)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	p7sm471497laf.17.2015.09.25.09.15.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 09:15:33 -0700 (PDT)
To: Christopher Covington <cov@codeaurora.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56057324.4080907@gmail.com>
Date: Fri, 25 Sep 2015 19:15:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::235
Cc: Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH]
	s/cpu_get_real_ticks/cpu_get_host_ticks/
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
X-List-Received-Date: Fri, 25 Sep 2015 16:15:43 -0000

On 25.09.2015 17:42, Christopher Covington wrote:
> This should help clarify the purpose of the function that returns
> the host system's CPU cycle count.

+1

Best regards,
Sergey


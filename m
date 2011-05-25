Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QPKKQ-00075G-VZ
	for mharc-qemu-trivial@gnu.org; Wed, 25 May 2011 16:05:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QPKKO-000755-N8
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 16:05:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QPKKN-0003qS-V5
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 16:05:12 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:64756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1QPKKN-0003qO-P3; Wed, 25 May 2011 16:05:11 -0400
Received: by wyb42 with SMTP id 42so10361wyb.4
	for <multiple recipients>; Wed, 25 May 2011 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:message-id:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YSwhZljIdPeeaY9SOWShdTvGE7T3gm1WMkHOBx0Dozo=;
	b=k+fnAE13EZYWAew2/pDgWJXsu4NcYNMfvAez+3UTah1ChPRfedkYzhzZ59BUe7K8+L
	eExwqZnfwoc50LR2jrcjLyIMQeMP1TO1QgWzRmMsAMA7NruabzvAUVGCRc7YuwB4P4gu
	OtfFHudcBMwySjactyZ5tlM4E3SD2cNuZbFoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=vWT3hxJeBm8BvFWXwZbml39UULzx/+i5V4C5ETffZn16+Rd/TM4vtMCHYzouRKbo5C
	4AOKmKKN//wOaWN9yzNYVZV3V9dX/y4M3R7kH3MasRse+rdAMiNqtpio0maCsOvtx8IT
	Jn+jAbCkcZBuxEHQs1yrdKk3sW4geLChB7YDE=
Received: by 10.216.91.17 with SMTP id g17mr5175093wef.1.1306353910687;
	Wed, 25 May 2011 13:05:10 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-184-88.ip51.fastwebnet.it
	[93.34.184.88])
	by mx.google.com with ESMTPS id f53sm497597wes.26.2011.05.25.13.05.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2011 13:05:10 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4DDD60F4.3050207@redhat.com>
Date: Wed, 25 May 2011 22:05:08 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Mnenhy/0.8.3 Thunderbird/3.1.10
MIME-Version: 1.0
To: Stefan Weil <weil@mail.berlios.de>
References: <1306344617-1645-1-git-send-email-peter.maydell@linaro.org>
	<4DDD4132.1080708@mail.berlios.de>
In-Reply-To: <4DDD4132.1080708@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	patches@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] configure: Don't create symlinks to
	nonexistent targets
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
X-List-Received-Date: Wed, 25 May 2011 20:05:13 -0000

On 05/25/2011 07:49 PM, Stefan Weil wrote:
>
> + if [ -e "$source_path/$f" -a ! -e "$f" ]; then
> + symlink "$source_path/$f" "$f"
> + fi

Please use && instead of -a, and "! [" instead of "[ !".

Paolo


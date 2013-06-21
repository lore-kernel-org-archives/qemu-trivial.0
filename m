Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq8nL-0008D3-IM
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 17:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Uq300-0001SP-U0
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 11:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Uq2zy-0000kI-8K
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 11:11:40 -0400
Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229]:50149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Uq2zr-0000Vw-F8; Fri, 21 Jun 2013 11:11:31 -0400
Received: by mail-qc0-f169.google.com with SMTP id c10so4734948qcz.0
	for <multiple recipients>; Fri, 21 Jun 2013 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=2c69fBg03Zhdy+rCVN2Nduoy0bxuffHC1P0lFU1gyTM=;
	b=RYNSiva2OnZ3NZtYaQa6oufOiUQlBh6LhgCZtyKFmNptjTbyfWQQ3nRqQ4nts1QnsO
	1WG1Oz2P7ifuI0PuelbxL2ugj2kEltS97obbnyPuA6OOvf1kMD61wyoA24o7tD+4plHV
	Rgc+DaLlR77lGoSMco2cjAotG+nhjQdtzpnLLXFYhnsoa9X/hCej8ivCooZTbtSjBFDk
	DLQGYtEQ0Nh1gaSTc6hugImivU1bETnbR6Pp3LMY/WGppL7w2Ft3lOvcM5EFkN3qgLEu
	KX8rc5ZkZonQDA1SJXk/gNbVcIyE5fZjr6ry8rp4Jz8KpJLZgQbWv3fe5kLuRy//0+Fm
	2elQ==
X-Received: by 10.224.45.132 with SMTP id e4mr14637128qaf.84.1371827491149;
	Fri, 21 Jun 2013 08:11:31 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id c5sm6859113qaj.5.2013.06.21.08.11.29
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 21 Jun 2013 08:11:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <51C46D1F.7040902@twiddle.net>
Date: Fri, 21 Jun 2013 08:11:27 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::229
X-Mailman-Approved-At: Fri, 21 Jun 2013 17:22:57 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Add signed*signed check to
	[u]int128_t test
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
X-List-Received-Date: Fri, 21 Jun 2013 15:11:43 -0000

On 06/21/2013 06:01 AM, Peter Maydell wrote:
> clang 3.8 with -fsanitize=undefined will fail to link code containing an
> int128_t * int128_t multiply (http://llvm.org/bugs/show_bug.cgi?id=16404)
> so add this to our configure test for whether [u]int128_t are usable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


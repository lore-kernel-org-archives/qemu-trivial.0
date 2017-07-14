Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw7W-0006km-HU
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw7U-0006hA-Nt
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw7R-0001qJ-LN
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:38:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw7R-0001pQ-HZ; Fri, 14 Jul 2017 04:38:37 -0400
Received: by mail-qk0-x242.google.com with SMTP id a66so10272045qkb.0;
	Fri, 14 Jul 2017 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=um+thmg/HhmrLkeUh3/lbu+FRmp3pX3PuoxB+Y+vuDw=;
	b=HS/7jyJDQPT/VZ13ox02V4FfL53FWM7CMdhjoNl9UHnAKEP6eRwxHaLcM6h1LULTFf
	gQX00vk2ZBcre7ORB3zqqsPgCB3Pd1eXomwqkjDamWZwAc0hHVH1sMbF7oliNpbV38ZM
	Tw9lp65J+bFNn2KW174+E9CcmMmDW9cCobPjx9GOlxEv/UuvkmJ60Qw3Mc+aOIf1gHTq
	yZlD4YJ0d53lKfuLEkPAhFkj1p2cJCr0BwIPqftDyuzby9EiMBcpTrdzeWWxcnF1PgXQ
	akZycvrYQbJR+ZaBmRdk0tciAIR2Y6nXd+V0RFyMZuoCX2xTCSWkIuH3szLonpy4b5A9
	DkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=um+thmg/HhmrLkeUh3/lbu+FRmp3pX3PuoxB+Y+vuDw=;
	b=l+habePmg002CIvmKfVBNw5kMR61tqbHf3MNj7tcm6sgnjz84FAC8WZ+kqk6bWmLgf
	yjY7/oi05L6rBo78wk3Glp1O8CjMiwE3xAn857KLwq0LIadjeN5av37b5FT1wQsFfhlV
	J1+JojA3D32GgJNvaehH7FmCvdTNwDJrTFpd7SoMczxYeAixc75Ra9bc40SAEuCYOPow
	+KVAzpqvItoDnSOp4OQHrkj7UcYGpgapi091xSiT2o5NnMfQs1Z97Lit2LJL0ZPZUjID
	i7rzjnq+AFeWxUv1n/iueLegzPyJW5ODrsDjEeuPDDeXk5L/17jHQGwhh3sJTzX4/0Kk
	Ossg==
X-Gm-Message-State: AIVw1119yuK5Y9VzL0CHVRFd3z8+tajigXWpA/IgltO/09APEd9hqbDH
	zpcC17qEPzgOleVCY5Y=
X-Received: by 10.55.120.134 with SMTP id t128mr9420551qkc.171.1500021517055; 
	Fri, 14 Jul 2017 01:38:37 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	m2sm6148433qtb.17.2017.07.14.01.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:38:36 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-16-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <20916f80-b221-5631-4714-91751ee7a885@twiddle.net>
Date: Thu, 13 Jul 2017 22:38:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-16-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 15/29] monitor: use
 DIV_ROUND_UP
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 08:38:41 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   monitor.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


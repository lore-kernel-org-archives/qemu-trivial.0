Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an8tG-00048I-9t
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 14:06:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an8tE-00045Z-Ke
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:06:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an8t9-0007Rd-Kk
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 14:06:16 -0400
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:33480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1an8t9-0007Qm-Bp; Mon, 04 Apr 2016 14:06:11 -0400
Received: by mail-lf0-x229.google.com with SMTP id p188so155848159lfd.0;
	Mon, 04 Apr 2016 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=YY+BCeR147JyqHk81obk0768/fXBv58J+pbQvG2IG94=;
	b=ik7jYsYBNhCC2QoplTSGSNTuBRPR37BsQc9DcP9Olh4kBGZpZ6A+dHbzoJuvBClZgd
	/nMcRhH9Ub0inYtR8SrSduZG58UuAZiibQYbIfbD0BW4tvyt/vnG40yON9NoRRkUR1WV
	LuwFKr1G9gy7utloJ4SihsV6SPQ1arpij3P5LilRmjkPUEAPakPKR3oHO+Mr3j6If/ci
	DQEvqgNeQoV+2ic5rFa/ECIfdrG0ykNbhTk/vt86bduRhdntiRuyI7r8haSJO7Z/ULiP
	Rj6AtxSZQTZRtheAkE+sqCeZHPcY+nuMjSngeqcQCDGb7dcibD+ePzrRB2H/KkEtFspD
	V1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YY+BCeR147JyqHk81obk0768/fXBv58J+pbQvG2IG94=;
	b=QSemG/j7PJfpVu5ZphIyKKmpFRQWoeXAUNrS67KNWH0odExZJ5WvKXZCa11u5G0K9S
	iCQ3AXHMpJSYGXH9U7Q5utzmF5kGKFDZmLolPf2npRXi5vAyRnetD+tIsXEXww/fh4b9
	mlPHGm18Om2om0DrTFysgwbwB8BTcX69ZoxsargnpRrAvNxGptfne4CLVmFAZsQGpXqW
	66/RVk2EKn+q2jJLwHtGH6RpVlDHisYFd7i0M5SNPIENHonzKgyGdkuW4UIQVJQz+k2e
	hEoKZ2D6Ui99lcvbuS5Qi3DiUhRukA9gvDsx8yGgbCOXHiV1fEU5YMsTUQy9Z+TIsYLz
	p17A==
X-Gm-Message-State: AD7BkJIVz8haUQOBH5DEeUtWV4YE7oDZmAzTcRO9awcBVw4IBF23OgH+UwXYtbmnrjqyrw==
X-Received: by 10.25.31.148 with SMTP id f142mr7238822lff.18.1459793170396;
	Mon, 04 Apr 2016 11:06:10 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	au9sm4832649lbc.24.2016.04.04.11.06.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 11:06:09 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <1459792209-25270-1-git-send-email-sw@weilnetz.de>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5702AD10.8040807@gmail.com>
Date: Mon, 4 Apr 2016 21:06:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459792209-25270-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build regression
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
X-List-Received-Date: Mon, 04 Apr 2016 18:06:17 -0000

On 04/04/16 20:50, Stefan Weil wrote:
> -/* Defining NDEBUG disables assertions (which makes the code faster). */
> -#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
> -# define NDEBUG
> +/* Enable TCI assertions only when debugging TCG (and without NDEBUG defined).
> + * Without assertions, the interpreter runs much faster. */
> +#if defined(CONFIG_DEBUG_TCG)
> +# define tci_assert(cond) assert(cond)
> +#else
> +# define tci_assert(cond) (void)0

Maybe wrap the "(void)0" into parentheses?

Kind regards,
Sergey

>  #endif



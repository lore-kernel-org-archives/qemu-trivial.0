Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtboK-0006mx-01
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 08:39:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtboG-0006im-Qu
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:39:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtboF-00069Q-O2
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:39:36 -0500
Received: from mail-yk0-x22c.google.com ([2607:f8b0:4002:c07::22c]:36097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtboF-00069C-HE
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 08:39:35 -0500
Received: by ykba4 with SMTP id a4so15335241ykb.3
	for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2015 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uEs15L9BHsMZl1kFDEGIYCc+psk8X3VwbRXBTrvKNpg=;
	b=O95m7TU9q2k8go8rIv9VQOdv4NJdrGlPRcdEPWSYU333DKjhK1BEjJZrj3ENahXXua
	bvklVCNUAh3J26vUWkKHz7mscRKt5Maa1s0WKmVQnoE1iH6fQWkY55trwnt8ij/jTszG
	QnHAkUYrF/9iP6gRZuijcslOGatHwUyHG87hIKzxj3ent4G0S4bamwqF0RME0LsB28z+
	dsnLJc+1gZGUxYEC1UhiyfjEEMq9/92IbOc0CdEQSnlRmXYkdEcK4PegNL01OWs3+RO8
	9H7blTKawTDZvFYdtF/BwmYCTiBIBkm5qSc1/Hy+D9zbeh6fO/zrXi0VOE5Mt8RmhzXj
	jmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uEs15L9BHsMZl1kFDEGIYCc+psk8X3VwbRXBTrvKNpg=;
	b=Xrbbla5OvO1PV7bP+0ZT5KAAkuah56JyiZI5P5szp2cmBiPpMguHDr9xJkm5lbQigo
	wdL9ZFdHGF6V91rcZ9nvD7MQYzudDFMcdzQpfpDz3Frx+6TKl2iLydiyqmZLhOdTgBYf
	i01S2JzlaZfIwiadcBsRwmUfpKKV+S3q2Xl/2f7+rMlureZSc990Zx80HY7k/ue0E/B5
	sh7ZQgwKSGPn1ZPl7+HxkCqnQv0sE2OT+iiFYO7uXNu+NvGOw2lQVWpVkop4Tc9o0k4H
	j4ubZGFJW43ewlZTbJl095ICpCO/uF1/JWu8P2fOvT3ywwTTFbk4zKHNjw37Eh6xXv7/
	NdCg==
X-Gm-Message-State: ALoCoQkvypJLb2Nr5Djro0ef4jMOFN5jOAfjBJnlF7TjooangEhS6mhGoimrB50JhLnPuelmpuX0
X-Received: by 10.31.16.3 with SMTP id g3mr16741555vki.83.1446557975043; Tue,
	03 Nov 2015 05:39:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 3 Nov 2015 05:39:15 -0800 (PST)
In-Reply-To: <1446518202-12162-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1446518202-12162-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2015 13:39:15 +0000
Message-ID: <CAFEAcA--Rq8iXJXSXeVgwqkh3bUAre-87euBnHt3f-Ev=3eRJQ@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH v2] qom/object: fix 2 comment typos
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
X-List-Received-Date: Tue, 03 Nov 2015 13:39:37 -0000

On 3 November 2015 at 02:36, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> Also change the misleading definition of macro OBJECT_CLASS_CHECK
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bukrp-0003hO-BA
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2016 14:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bukrm-0003er-Sf
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bukrk-0006PI-Ul
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:36:29 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bukrk-0006Oe-An
	for qemu-trivial@nongnu.org; Thu, 13 Oct 2016 14:36:28 -0400
Received: by mail-vk0-x235.google.com with SMTP id q126so35950806vkd.2
	for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2016 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Uh4QYz+J7vLW9Af5sa7GD/1T8u5WdhaKZ6bgtiub92I=;
	b=f9QlzmBRILdXpwnR6bbtONp1zAb3uXAf8sbAhr5Oi3SOp2hWk7idnfWfa19uLaWaUG
	HvhQp4ZhnAc80OC4GOVWTXxPsfUw4OdqWH7OEGDT6MWoQGy99x5QE5zLtVI7bYeZvdyw
	+EIlpGceTdFJGAXEMobhzggsmTrdGzTVj3uWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Uh4QYz+J7vLW9Af5sa7GD/1T8u5WdhaKZ6bgtiub92I=;
	b=A+oRzVAHpasoKIoT4L20Ov+BakRjckBRFHQ9C6QBScRLqK6zh8j8J0usVYbCUzAO0u
	UtbHo78PGabEDwoBTZDk7AJkBlfadprMuDdIvI4lyr0S+t7FRCxgmy7q4fEW9Z2kwYsa
	cDgwZRSR/b7/rqMiReulRKdY0clFoRD2BIoAzIolpc8KiA+VRCvvePQXPVzm5sssKGVB
	AL92Dxb20pFqsm9s5EwCJ0WPaL1U9QHDrvZUldgDVzuVWwbQ3Q2g+Uj9A07pHydk78Bo
	rFAiWM8QBVVgEBL6d4Ugax+rx0MDFj6rB66ynMyNzYSQ27rKh7kBPjuvfXwfkDb9D1rt
	Kc7A==
X-Gm-Message-State: AA6/9RkD+0hav5y/p/187nRXDt9b6Z+fvo3mUtzvU0/l/Tmc22vq0uKRI3D6OpJa4D4TpXw3PC12PCZKJAxhyl0y
X-Received: by 10.31.206.198 with SMTP id e189mr4878365vkg.51.1476383787684;
	Thu, 13 Oct 2016 11:36:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 11:36:07 -0700 (PDT)
In-Reply-To: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
References: <1476383370-30650-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 19:36:07 +0100
Message-ID: <CAFEAcA8QADee1et4jSGP26i8atRy2KG29wMab_nieisNvCicEQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix build for less common
 build directories names
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
X-List-Received-Date: Thu, 13 Oct 2016 18:36:32 -0000

On 13 October 2016 at 19:29, Stefan Weil <sw@weilnetz.de> wrote:
> scripts/tracetool generates a C preprocessor macro from the name of the
> build directory. Any characters which are possible in a directory name
> but not allowed in a macro name must be substituted, otherwise builds
> will fail.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I had problems with a build directory of the form "host,variant".
> Is this fix needed for stable, too?

Why does it need to care about the build directory name at all?
Ideally builds should be entirely deterministically reproducible
whatever the path to the source or build directory names is...

thanks
-- PMM


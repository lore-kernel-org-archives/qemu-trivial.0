Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFT1x-0002o4-NW
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:58:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TFT1v-0002nY-Cd
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:58:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TFT1u-0003Wv-J3
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:58:11 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:39009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TFT1u-0003Wn-E9
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:58:10 -0400
Received: by iea17 with SMTP id 17so3155004iea.4
	for <qemu-trivial@nongnu.org>; Sat, 22 Sep 2012 09:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=y5/YOnXt2KisrhdEjhfOSBn2plj4iC+60luxHh5ObNg=;
	b=D8C35fWKXg/NGjpOZyAsmgdLeprhh3lTK5RBN64jB1fK7W7M+iKibSc63J6XIt/mSr
	VGl7/1dzxGUmr8njOhsQy+YYI82OxVD0Pso1ms4Tu6hLdqwYFydLpgOV45qAx+GaopqB
	/HbZnNc3MibTa4twiWbaHlNeniQMqobUbbvhYesWzlGAt0SAZH1pHrTIeLs3NQsli37F
	qza37x9BfWSlxWYyauInGrZ8PomY/O7+F3tbYeu8yp4e4ovYg3uItz206pConCPwpD6e
	iOsF4q9X3zkiyEhoCiwumZoAD7JNNowMTPKwmunH4z4N/yEqTvFJj9thQRZYGB+hyAMY
	9/fQ==
MIME-Version: 1.0
Received: by 10.50.5.239 with SMTP id v15mr1447520igv.41.1348333089451; Sat,
	22 Sep 2012 09:58:09 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Sat, 22 Sep 2012 09:58:08 -0700 (PDT)
In-Reply-To: <20120922162920.GB14154@stefanha-thinkpad.localdomain>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<20120922162920.GB14154@stefanha-thinkpad.localdomain>
Date: Sat, 22 Sep 2012 17:58:08 +0100
Message-ID: <CAFEAcA-H_J+DRWsfNhS0sXzMX4FQMUTjah6o-q933WcD4CNApw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmHFPgrvY9K/kMyObaPujOZpV0hOuQJ27YyCQ/hiFCMNBRRib0Cn1z2xNJpYMCkPObReyqM
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pflash: Avoid warnings from
	coverity
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
X-List-Received-Date: Sat, 22 Sep 2012 16:58:12 -0000

On 22 September 2012 17:29, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> Please report the errno and possibly bdrv_get_device_name() to uniquely
> identify this block device.
>
> Peter's comments about reporting errors to the guest make sense to me.
> I'm not sure how much work that involves, printing the error is a step
> in the right direction but we shouldn't forget the TODO.

I don't think printing errors to stderr at this layer is the right
thing to do at all. You can make a case for "print nothing and let
the guest handle it", and also for "log errors in the block layer"
(which would make all block device users consistent and mean we
only needed one bit of code for this rather than lots), but I don't
see a case for printing errors in the middle of the stack like this.

(I am also somewhat reluctant to add further random fprintfs without
instituting a proper controllable logging mechanism first.)

-- PMM


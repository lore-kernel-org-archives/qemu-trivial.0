Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWpJ-0001PZ-84
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:55:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWpG-0001NR-Vh
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:55:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWpG-0003Tq-7a
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:55:47 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:35538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWpG-0003T5-1I
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:55:46 -0500
Received: by mail-wm0-x233.google.com with SMTP id v186so151663wmd.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iQLcFTjcuceA6B2K3368oUu/8Pas+Ey1xsuzu8h9ZdM=;
	b=FBEmrCGwCgaS8dnVQobVMlug/AFH1T01Wrryd7qYHbotXd6wfykqq5X9R2PWjuMcHh
	ReqqSFy8gtDlee4a2YzEwrA5+5l7/O33dIrzeCTsLL/pxQ4uXDBJNe0KDZWh5fBAeVE8
	q/6v/vdQ7VhMiNlbDwI3xRLJ44hREdDVWpRgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iQLcFTjcuceA6B2K3368oUu/8Pas+Ey1xsuzu8h9ZdM=;
	b=WFSt2dqmbpY09FDd3pc9LQZhVt75LwWW3MGEEHAkSBAYm/ODn3GOq8X1UuAjQxT7sT
	cWEsZa7BsVgXeVLbjF+wvuh7EoO9SS5S6jO9QB61SeaE/MABmcA0Ykva4xkUjfs/S2CC
	Cho3CmSgdoiLkcO4fBulXPlCTedjxxUX6WkyMvL+YDkyNB5dYOfEYw+O7T48yb0/7QGh
	d+NqdYgVqzVqdFxKK8DEeVnt9CT3gwJ7oTzxUVsJZ8Sc+jsZsi4d//Y5HHmpTr7rsxWe
	dqV0HcJnhmFvoquPQylWU4akGYiUmjkOYd/9Hs39YxEAKf5xjWyah6rBJs9mUpROYr33
	B2Bg==
X-Gm-Message-State: AMke39n8P6lUE0GKs3YM/jxInYrsFMdfWyxNthEQVUuG8ABc2we8u1LD8wmBuq8IQ/vtP8XW0NbRvWZi7n98WP/a
X-Received: by 10.28.226.215 with SMTP id z206mr19423wmg.92.1488484544973;
	Thu, 02 Mar 2017 11:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:55:24 -0800 (PST)
In-Reply-To: <6a3ecc27a153a5e79ba19542760c3037fe5c75f4.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<6a3ecc27a153a5e79ba19542760c3037fe5c75f4.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:55:24 +0000
Message-ID: <CAFEAcA_dY4UF8s8JtxGUtjJ_Mfvz5Gv3Mfypz45TAtnHuHQY7w@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/14] sm501: QOMify
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
X-List-Received-Date: Thu, 02 Mar 2017 19:55:48 -0000

On 3 December 2016 at 02:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

It would be helpful to mention in the commit message that we don't
yet implement reset or vmstate and that those are coming in a
later commit.

(There is almost always something useful to say in a commit
message body; subject-line-only commit messages should
be the rare exception in my opinion.)

> +
> +static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = sm501_realize_sysbus;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    dc->desc = "SM501 Multimedia Companion";
> +    dc->props = sm501_sysbus_properties;
> +/* Note: pointer property "chr-state" may remain null, thus
> + * no need for dc->cannot_instantiate_with_device_add_yet = true;
> + */

This comment should be indented.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


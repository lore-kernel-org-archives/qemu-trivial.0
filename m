Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez4WC-00061b-No
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 14:00:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4WA-00060O-Qj
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 14:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez4WA-000500-1L
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 14:00:50 -0400
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:36515)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez4W9-0004zd-Rj
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 14:00:49 -0400
Received: by mail-ot0-x236.google.com with SMTP id 108-v6so10435012otv.3
	for <qemu-trivial@nongnu.org>; Thu, 22 Mar 2018 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iQcvNunmzOq3ivGppgVV/z4QN9zJhqdYAItlCRAMhsk=;
	b=bNm2eEkH83SKV5VCb87XhToE8WnUAestSsSr0JVBkChc57+Td9Kh4OMon5f+kfVzjd
	nNxJSOlpUnmtG1eJXUf0So3YzY8mJj3sXivqZfWzuncPc2kVDiJwPQppPGPoasFo3zzG
	cq8Jf78rL/CiHp5+HhN3Sgf6mfFv8OZ4gxcPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iQcvNunmzOq3ivGppgVV/z4QN9zJhqdYAItlCRAMhsk=;
	b=SNfAEYOOeRrnM8zcfUMkhyU3cY5xH2MjZOOaJ/uL0Mhw9gYsxbEu3tQOzCz2o+KOrY
	42NalbuwOxiJoeT0WerbaYUXMASLOUETHdLj3ChfSgrKUuF9zIwXqV/OzdV9o3KtlRy7
	rxZntSEonXdGRvcRsycYTyRzoVUeaP6Zk37aqk5VF3ok8q6d3GTRXf2yCcVoenvnrEEr
	UzbTzoCgJEhoS5vMzbt/SbpMeSkjnecgn4vgOJHlzAXj4I+GNCshuyG7WeDtVpDwCEzt
	RiyQzb+Xey4Qga9H3OWdB/CdhTRez43TwqxQrfSxdUtdk8ShqPnm0y+WYDa8vII0m9ur
	MVuw==
X-Gm-Message-State: AElRT7HFCAsCqfszy+6ObxvxUQ7aDdbpJ9G7T6ciDkK+qhp9E3QJOIyb
	VwEie1uFYpUnQfhuUba7GsvWHDLxuB9Q8Zakw+nPTA==
X-Google-Smtp-Source: AG47ELuRpYq5R6+yxfuPBy1p0ZI5lHotyC2OPLkhW/nv8cH5j/r3hrtx53RRSmzMXh6qoYPfU++g6TRqCM8agzKf3qE=
X-Received: by 2002:a9d:285d:: with SMTP id
	h29-v6mr5980147otd.205.1521741648758; 
	Thu, 22 Mar 2018 11:00:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 11:00:28
	-0700 (PDT)
In-Reply-To: <152174145840.240.3926671265619235661@71c20359a636>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<152174145840.240.3926671265619235661@71c20359a636>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 18:00:28 +0000
Message-ID: <CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>, 
	Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] coccinelle: re-run
 scripts from scripts/coccinelle
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
X-List-Received-Date: Thu, 22 Mar 2018 18:00:51 -0000

On 22 March 2018 at 17:57,  <no-reply@patchew.org> wrote:
> Checking PATCH 4/4: Remove unnecessary variables for function return value...
> ERROR: return is not a function, parentheses are not required
> #251: FILE: target/mips/dsp_helper.c:3281:
> +    return (temp[1] << 63) | (temp[0] >> 1);

This looks like a bug in checkpatch. I guess to fix it you'd need
to make checkpatch count opening and closing parens in the line
to see if it goes to 0 somewhere other than just before the ';'...

thanks
-- PMM


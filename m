Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL40z-0001xn-NQ
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2022 10:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oL40x-0001xV-Mc
 for qemu-trivial@nongnu.org; Mon, 08 Aug 2022 10:45:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oL40v-0003Kf-TI
 for qemu-trivial@nongnu.org; Mon, 08 Aug 2022 10:45:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id j1so11198409wrw.1
 for <qemu-trivial@nongnu.org>; Mon, 08 Aug 2022 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=LirsAiipfXb+QWMHSbcKE6U5374CRC2uE46mpJ53z9A=;
 b=WfSXXXW2w2YDmuEk/EUN/y3LICiaO+8APaw2fI4U68c0+FyJF5nJzDH4pkAOxiw2Y5
 qBdk2AmsB9xoVcf8vPjaCTR5oOsVXWIAS8u1VvNM85BPGhZ4MJ6gJw2uejxV6/2DVvvc
 PQhWPAdx8pArfYZb+O70hjtVzKf3HsvRrhR7I92TD5bIJTBa1cLKqF4wh+4nkGVOxxA9
 qoyjLZVEBO/u395MNxy/gTmwQqHKnz4nbSAZuzpAlXVBNtLRQttKRusFLtEQTrJikagH
 ZMODitNZ4JVtNpM+7Xgh6D970FQZBXOqU+aECcWaz1GEQjpiNCkjdaCcPXnzNlTOzbJJ
 6aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=LirsAiipfXb+QWMHSbcKE6U5374CRC2uE46mpJ53z9A=;
 b=IFTNlD83RZ4VVyR42mRei/FxtIeqgZXoOCGPn+674/4e12VsaxQw4mVmKJJ2sX9e6o
 KQlUyj/rgd60OcPPzBUxkr7l820DV4ebUCmKA7LVzFJnZKIOtLq1IvWRSmpf0lgp2XPK
 JyNnZhjRNZOsmahuBV29nX/1wyqHtjsOivnrXCTL0eCVibCsIxiat33/IribfwNa9CW/
 lvyco5U3yG12FzoTr4Bvjn2qrAg2FQ8cnMlcRXC20cQNYU8S0y1uyK50imRhkGnvwUl3
 WYDaoeqBYH1MVqlf8ESWdtVn/zKjvF0Ctf9N5FsGjHgXKEfCevHUcrrGSr/RiLQ4BzCn
 NPyw==
X-Gm-Message-State: ACgBeo2ISE++B5iQPyq63JKD18nRXBCt9WmJgqoGzrAeYPmDdOI90hmK
 1/ppAl22evz5wMW3EE5Ju68dcQ==
X-Google-Smtp-Source: AA6agR5fCiXRiope2TrKTZ9DpW8+oFeUhHRTIz2fRK0pYUITFFr43wNW+EztZubwUOC30RkyhHIEAA==
X-Received: by 2002:a5d:560d:0:b0:21f:1619:ba0 with SMTP id
 l13-20020a5d560d000000b0021f16190ba0mr11599904wrv.318.1659969951925; 
 Mon, 08 Aug 2022 07:45:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c424300b003a53de38c0dsm4912645wmm.14.2022.08.08.07.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 07:45:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 613861FFB7;
 Mon,  8 Aug 2022 15:45:50 +0100 (BST)
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev> <87wncx2xw4.fsf@pond.sub.org>
 <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
 <20220727172759.GA30765@raphael-debian-dev>
 <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>, Markus Armbruster
 <armbru@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Date: Mon, 08 Aug 2022 15:37:19 +0100
In-reply-to: <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
Message-ID: <87czdaoktd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2022 14:45:56 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 27 Jul 2022 at 18:28, Raphael Norwitz
> <raphael.norwitz@nutanix.com> wrote:
>>
>> On Tue, Jul 26, 2022 at 03:57:42PM +0100, Peter Maydell wrote:
>> > On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wro=
te:
>> > > Could we use a contrib/README with an explanation what "contrib" mea=
ns,
>> > > and how to build and use the stuff there?
>> >
>> > I would rather we got rid of contrib/ entirely. Our git repo
>> > should contain things we care about enough to really support
>> > and believe in, in which case they should be in top level
>> > directories matching what they are (eg tools/). If we don't
>> > believe in these things enough to really support them, then
>> > we should drop them, and let those who do care maintain them
>> > as out-of-tree tools if they like.
>> >
>>
>> I can't speak for a lot of stuff in contrib/ but I find the vhost-user
>> backends like vhost-user-blk and vhost-user-scsi helpful for testing and
>> development. I would like to keep maintaining those two at least.
>
> Right, I don't mean we should just delete contrib/, but for the
> things currently in it that we do care about, we should define
> what their relationship to QEMU is and put them in a part of
> the source tree that says what they actually are. contrib/
> just means "nobody thought about it".

I split plugins a while ago between:

  tests/plugin
  contrib/plugins

where the former are really basic plugins that show usage, exercise the
API and are included in the check-tcg tests. The contrib plugins are
slightly more random mix of useful (e.g. cache, execlog), downright
experimental (lockstep) and stuff I can't actually test (e.g. drcov).

I'll quite happily continue to process patches that update and enhance
contrib/plugins but at a push a few could be promoted to less of a
dumping ground (tools/tcg-plugins?).

I guess it would only really matter if we were installing plugins as
part of "make install"?

--=20
Alex Benn=C3=A9e


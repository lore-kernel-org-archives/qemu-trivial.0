Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF6A1093194
	for <qemu-trivial@archiver.kernel.org>; Fri, 20 Mar 2026 09:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w3VxZ-0002KZ-2k; Fri, 20 Mar 2026 05:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3VxS-0002Ij-Hi
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2026 05:15:55 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3VxN-0004Lj-I0
 for qemu-trivial@nongnu.org; Fri, 20 Mar 2026 05:15:52 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so409569d50.2
 for <qemu-trivial@nongnu.org>; Fri, 20 Mar 2026 02:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998147; cv=none;
 d=google.com; s=arc-20240605;
 b=YoDYvn20Qia4pcTS4nYPqi5wO6+qPYmALNXlLDyK931kXFjChprwPJjoggdfQr4Rr+
 V48OBFt+/XoUrckT3/cXduK0sTtzmf1Xe4u29r6gnUSlmC3QZNJvGGHmqYkUWVgoi+9x
 8iw/mHm10YZVbM0NacFTAzhNgdRNp/ZocObEGzmK5Wr1MzXGsfoIjIoA/rfEbBOuvjrT
 osjhRO19ou3ybMcYIr3xLSbAZE8iuyl0kUm5LtKIqcaVejCdprvGinoOqchbkugyKPJ3
 km8/SrPbfWKowj7/yXqaRBhLqmy1iim6xa/F+MkJbrfI4qCfWQkoksyX74BN1aPjq1W8
 WQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 fh=t0eJlenDDj1Q9rwA28KK8WJOZLKX8VMnXw3Fnl+dJX8=;
 b=C9DUGslhOObrvl74ol5pEDZK1kbGANalaGBUhKmbnVfxVN/NNmChMjY9PxHqZQIbFq
 0F9dipoQAqoCYIJf8APqZHcowKytPPu/P3K6ZhR6ZO+HCzDKHhoszMyN4tSXc/QLR98Z
 RU/vPmG4ZCVNliT7BLPrNkPCP/j8RcPSal/U+F9/HgnY/Gi+Mx4osRWuSMvpPY5oUXxS
 Go6WQqqdEbEUXDRkVeItBBGe0/9pPkbCC9FZ9GwmNA8RoOJTUbAIbhfQIc0ZBAfRXKPt
 WAx1VAHfmghl4YBM0rRVgU1swHSUKN+QP3TkVo1cZ/WQl+Bm2DvQ/DV0BBmm3DObjKHs
 ZjiA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773998147; x=1774602947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 b=B0XubGYh3jCz2LqywfONlu1rFNxlQhd2hfAPurHlX/eXrlutLH/Zsepaf6zbQMtEqi
 ubxOijU1Ifw9t7cngcqgqAys1s23//vG2RhE7qxy8yRyk7DhBZRg5QkNjqse1NV2S/Fv
 lBNrZLgTp4Y5Kke8OH9y8LZ8lnEMNyRHcnxADQR4VTKa8ZmX9xqdYqBswSciYY+5TXQ1
 4t11E3GtbExurOT0D8pte1dihYKZIKWgeRvxnp1J2LBnpWy9XrGs8PmJuxtk76PHNroR
 h51hPWqb7Ff96UyfOCHHDV9/jsh9tQq9yj/YFItX7JRGLWVWL7H6PwvbOC1Ucc1T2kSW
 j7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773998147; x=1774602947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvbAbu4dMgvGESlCuQajDMiqKKtL32Q9bNx4dGp3Nfk=;
 b=qCbcUPTrVvuXoJpDgNjoq19UpSxGjlUK67yF69O+lN5UaWawYqopsr2m9bkzd82B4k
 irPugearDUNI4VFCbSWO18wuA3oPOU5/Qv/0XLs1fcRASL8FPZ47zquTED8iAvzSXa6v
 CdeYDbDUSSWYFqqgEL9/Er7bCm3thKPIGUxwNzDKSZ4lojuGjLJU26VNcuLW5jOvlQqc
 4B/4Y1Xql6tsVH2HbbCS3AGITa8IpBjO7OopbSxrb8dwMYrD2ABNbT6fqbJUoNY+swCM
 nepD7B25MsrDwgV2yucyAALHkNlTFhjiqvf0Ca+ut1gN3lk9P2asxgH68JtPPAhpjHJp
 mD2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUlsHqvrS6n/dcEPu6lQuvWj993237RKBOPYDOJrCckkWs+pu3wwAuS8IF0beFfrz7hgHZiny2WNhUA58=@nongnu.org
X-Gm-Message-State: AOJu0YxivyK9iL4PAkKp5oMiIlJBDxGu3+e7elAkGFzMD6d89j229tTF
 GyT+FNDra7Oj0LnPVLnWnFvPcv0/yuV/5XcUzDKNuEZzAX6hjLrlDTd39US4emutjhw2oEGpmg+
 cvIGtJKTiEMd6EjEC4MrwlggYGs5YHK9F8I1al6RhAA==
X-Gm-Gg: ATEYQzxy8RtrYhObJ1ikq+KBh77PSsgJctQYzF1B9SpBEEy47S8JbCV42FDvm3bgBUj
 8mkRRTqySHXwPS2JIGFIiMSTwquIpViF/opSzjlOqnlOGPa3789oiC5TD11sQmL50xBd9p30MU6
 awWAs0SGezrP0Wa8CCfb0WpRErnWHwP0daIWfdm3oT10kP99k+yhTpBvZQYHssVBH6VSVTYnhDp
 WhwR6lg/wyINKh76N9YIU0Us6PGQCZ2ngf+au/j0KVbV3rW4g4ZN6P+WZDqkAedjWsjXnvOtb24
 mQ9b7I0x/joGSM4Ty+yPubnYioWPCmmEfE7KNPX2Do2gGJQPkqinCBpBVNb8FZNVpNU=
X-Received: by 2002:a53:d786:0:b0:649:e546:62e2 with SMTP id
 956f58d0204a3-64eaa7b630cmr1712151d50.44.1773998147305; Fri, 20 Mar 2026
 02:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260319183453.100545-1-sw@weilnetz.de>
In-Reply-To: <20260319183453.100545-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 09:15:35 +0000
X-Gm-Features: AaiRm52Fvg_cJmMP4ysqAEFDoenflm5VgYoBeXreXaBQdPTgtKQsso7DZjlREB8
Message-ID: <CAFEAcA8dzqPVUyt-bC4r8QxZtJ6dBacgeMG71JEsCsUoGgDsSg@mail.gmail.com>
Subject: Re: [PATCH for-11.0] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Thu, 19 Mar 2026 at 18:34, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>
> These typos are part of the generated documentation.
> Therefore they should be fixed in the new release.
>
> More typos can be found in the remaining code, mostly in comments.


> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index f8d446b3d6..e8adaaea34 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json

> @@ -5086,14 +5086,14 @@
>  ##
>  # @blockdev-set-active:
>  #
> -# Activate or inactivate a block device.  Use this to manage the
> +# Activate or deactivate a block device.  Use this to manage the
>  # handover of block devices on migration with qemu-storage-daemon.
>  #
>  # Activating a node automatically activates all of its child nodes
>  # first.  Inactivating a node automatically inactivates any of its

We should also change these to "Deactivating" and "deactivates"
for consistency.

>  # child nodes that are not in use by a still active node.
>  #
> -# @node-name: Name of the graph node to activate or inactivate.  By
> +# @node-name: Name of the graph node to activate or deactivate.  By
>  #     default, all nodes are affected by the operation.
>  #
>  # @active: true if the nodes should be active when the command returns



>      ``param=string``
>           ``string`` will be passed to passt has a command line parameter,

should this be "as a command line parameter" ?

> -         we can have multiple occurences of the ``param`` parameter to
> +         we can have multiple occurrences of the ``param`` parameter to
>           pass multiple parameters to passt.
>
>           For instance, to pass ``--trace --log=trace.log``:
> --

thanks
-- PMM


Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972AF4180E
	for <qemu-trivial@archiver.kernel.org>; Mon,  9 Mar 2026 16:35:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzdZu-0007GK-VW; Mon, 09 Mar 2026 12:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzdZt-0007Fa-GV
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2026 12:35:33 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzdZr-0007XG-Hw
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2026 12:35:33 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64ae222d978so11507408d50.1
 for <qemu-trivial@nongnu.org>; Mon, 09 Mar 2026 09:35:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074130; cv=none;
 d=google.com; s=arc-20240605;
 b=B1BmhnLdLXFmMueKixWyjmtqB9bojJBfY1w/ros0ucZNpmvx62Zewnvd0jkDY+DOOp
 GG7nfZfeLEpAmwmnUi7qD3flF5cpYCKb06W9Fb4j6MQA7/sRX84rall9kkE15qQmpi11
 0CBpXRasm+MwMk6ZZrscXfZO6zifbO1AQhjs1Xjn/pmqYhMtVt/6ZGtena6fuCdm1Nwd
 bzU5uqTvCFmKxpO2/U3t9VGimcKIp/DuA4O2BYSgihHXmqJhUp/WdLzilXlG3lhGoqSg
 n/uD/HbOvK+1iehxJI77K7RVvXH6wnkqZz6fsYpX+1O7HnK9JdFxrW2PfTO/Ta51HXH+
 p/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZSPm0Ofg0Eb4oVi8NOscKCN6Vf00mZ9r+zi+X/F4Qmo=;
 fh=Unczt4PgqOjP92MIFdRrFQKg7Mumppst5R03eHH2J+4=;
 b=CVLmuuc/TADocee6GkI+jHaJgV8GjzQ5uAT2WDsgQp3kC8CfZlB3gbBxYEklH4qcTm
 jH+ZeAgl+m3rJUMRC08F0164NuLXa7dRg5t5KzNRJ1Z4rz3fu8uAp1LePxVz4za7Uyhw
 Df2AfJ/yf5fv42HuNMPXjC95XleI6bbx94eaVe3G8XusMpmsLzmNhLr8SbuuxhPqyzgl
 JEP1npM8CT7EFtOAfB2djiaOKfij+1f6N0qcTP9DLbo/QmSGwBZZ0dgcnWgjevOO7a1b
 vjd/r7GWG7pD8S7RkHka0Wn+FxQn9ERlcTd/cmOCnbbN1k5WQ27gSc5ZWLqeIZ6iwab0
 M9Zg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773074130; x=1773678930; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSPm0Ofg0Eb4oVi8NOscKCN6Vf00mZ9r+zi+X/F4Qmo=;
 b=vnhNDphAWYtNfUIm/3MdV18mLqG9T4d9iAnp9czuS7xEUtyEigaYd69ljcvMpHbjni
 o7/Xo55VP6pgvKHU2flf2drd6LpXK4/gByQKWIeNSygaBIAB/U8vMT+M2lNfbBje2KH5
 OX1FEbhuvfPVu/Ehqg6Z8Dhq+f8OMGKBnuyv9xv4m3eya5zrVFQ3FM55C/6DtwZXWtht
 BtNuLiAAd1g+TCTliy7QKwm0MFN0zXdLThP3CjGDf0x868q03ApaXyeC48iy3k9ultx8
 tCDlDVAfPgnfDttqUmvYW08/T/D4qL5Al7uNEcHCmEP86wDAcHHQyGFkaEvUku4VCIAT
 tCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773074130; x=1773678930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSPm0Ofg0Eb4oVi8NOscKCN6Vf00mZ9r+zi+X/F4Qmo=;
 b=GxhN3flU6erxKiKDFiWnu2w85yDOHUkuHe0KvbjO1Z90lOiFXKC0oalbOPZtN6gEnk
 bJzT12aMsn6rX5dQFdQMT056eDCp8BA1bphd+j+bTvy9O3npWiOso//BNp5DqH+iqtxH
 Uad/WdQaiRjczFvNPNsXf1fozVci496Z4Ea64umxG5iPGEw2B0HkzFsbj0eY2oTOvw3K
 2VryA4Np2XcTnp8Vs8CzIVPl/boWI51foOu8o5u+dt5AlpfbQyWO4VSBXW1WuZIQ2rOc
 ohB9B9yaQLCnBOfZwPEdZ4DMI5t/Hd0LpyPWRJ/eVk264yW1NB7oHXkHv1210ekwt098
 +rdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXodzsV5u5rjssHlR+Toryn8ifHhsH/Ygr2XzAhtwXs3HVfvNSm0IjomMT8WxI//wwzyj95cHyJfP78Iro=@nongnu.org
X-Gm-Message-State: AOJu0YyNqN29tfpEl27jtpQbalUmYkTLXsh/pkj3+4QkDUfVL80AmP3C
 U+vZ6ESJEghtD5L5BIuR6lPxsHl65Us7fY5ePjZNs+C3LdecEOVNpMyLwpZ/FprawTeKddGjHXN
 XkQMCU9F0EdAjW3VqhOYID5OVp52VMZexr1WuRp63Yw==
X-Gm-Gg: ATEYQzx9WT7Cc3Lr8egVCF4+uqJtRNZQ3xgRoeLxOG8YiD52hC/6SAH09TvpW3MHBE5
 SUPcib188Wwvlh9htwGQemA+RTC+0EeGMLQKcKq1MZ0BZx1sfoasrbRlzOTsuR0eNnm79Cpw4GC
 b4uyJvcA6O6S77sqn+/MQqVCM9qz/xaCPJMT+nhSegU/bj159RLFl6Cd7+YAd26zQ13FDO9e3vw
 LXwttpr/QEc13DMpjLrGsQEocnfSwLgeSS86CkryTbbXto3bZGnE705lBB0IM11NJqK1sTKbVYD
 BYzfJXxE3mIDtUwAa01/i/1ukRzB0DNHQEZ9LK2jhyhCMih2pIT+Dl/tl91kHrF7IoIITAen0B9
 rnw==
X-Received: by 2002:a53:e1a2:0:b0:64a:d18a:66bd with SMTP id
 956f58d0204a3-64d1407dabamr8206612d50.16.1773074130054; Mon, 09 Mar 2026
 09:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-add-missing-plugin-docs-v1-1-41dddcd177c8@epfl.ch>
In-Reply-To: <20260309-add-missing-plugin-docs-v1-1-41dddcd177c8@epfl.ch>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 16:35:17 +0000
X-Gm-Features: AaiRm51UH6YFQBYjBsqw0-TrMlPJDHOw8I5micKgw-T8g7-lbJz_4kwsXy2X3NI
Message-ID: <CAFEAcA_WAnfxtCgfhX4oGa7eJhvs9aWgsU46CGGzgqNfBX28Dg@mail.gmail.com>
Subject: Re: [PATCH trivial] plugins: add missing docstrings to qemu-plugin.h
To: Florian Hofhammer <florian.hofhammer@epfl.ch>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 pierrick.bouvier@linaro.org, alex.bennee@linaro.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 9 Mar 2026 at 16:22, Florian Hofhammer
<florian.hofhammer@epfl.ch> wrote:
>
> This patch adds docstrings for typedefs and function declarations in
> include/plugins/qemu-plugin.h that were previously missing. This
> resolves inconsistencies in the docs, e.g., the description for
> qemu_plugin_read_register() referring to qemu_plugin_register_flush_cb()
> but code cache flush callbacks not being documented themselves.
>
> Signed-off-by: Florian Hofhammer <florian.hofhammer@epfl.ch>

I don't know this API either, so a couple of questions below
for those who do:

> +/**
> + * enum qemu_plugin_mem_rw - type of memory access
> + *
> + * @QEMU_PLUGIN_MEM_R: memory read access only
> + * @QEMU_PLUGIN_MEM_W: memory write access only
> + * @QEMU_PLUGIN_MEM_RW: memory read and write access
> + */
>  enum qemu_plugin_mem_rw {
>      QEMU_PLUGIN_MEM_R = 1,
>      QEMU_PLUGIN_MEM_W,
>      QEMU_PLUGIN_MEM_RW,
>  };

This define sets up the values such that you can use
the _R and _W values as bit checks (i.e. _RW == _R | _W).
Is that intentional and can code using the API rely on it,
or must it strictly check against _R and _RW separately?

> +/**
> + * enum qemu_plugin_mem_value_type - size of memory value
> + *
> + * @QEMU_PLUGIN_MEM_VALUE_U8: unsigned 8-bit value
> + * @QEMU_PLUGIN_MEM_VALUE_U16: unsigned 16-bit value
> + * @QEMU_PLUGIN_MEM_VALUE_U32: unsigned 32-bit value
> + * @QEMU_PLUGIN_MEM_VALUE_U64: unsigned 64-bit value
> + * @QEMU_PLUGIN_MEM_VALUE_U128: unsigned 128-bit value
> + */
>  enum qemu_plugin_mem_value_type {
>      QEMU_PLUGIN_MEM_VALUE_U8,
>      QEMU_PLUGIN_MEM_VALUE_U16,
> @@ -353,7 +369,13 @@ enum qemu_plugin_mem_value_type {
>      QEMU_PLUGIN_MEM_VALUE_U128,
>  };

In this enum, the values are set up such that if you have
a qemu_plugin_mem_value_type vt, then the size of the data
is (1 << vt) (i.e., a byte is 0, a short is 1, 32 bits are 2,
and so on up). Is that intentional and can code using the
API rely on it, or must it strictly use the enum only as
something to switch() on to select a length.

I actually ran into that last one in tests/tcg/plugins/mem.c:
update_region_info() has a switch() on this enum which (among
other things) sets val_size in each case, because I didn't
know if it was guaranteed to work to set val_size = 1 << value.type.

thanks
-- PMM


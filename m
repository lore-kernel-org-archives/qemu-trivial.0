Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1od6bk-0007NP-Ju
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2022 05:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od6be-0007Ir-Sv
 for qemu-trivial@nongnu.org; Tue, 27 Sep 2022 05:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od6bb-0000Hm-Dk
 for qemu-trivial@nongnu.org; Tue, 27 Sep 2022 05:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664269818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9V4mOxC7ZTYZ2NRPEsPcHZxTuIPyyP5Ra1HTlnicr0=;
 b=cjc/UyGVnbo4hkywtdZ3GEvN1SOe/OPBIs4pEAbOjgtUYCmE7mwyau4+xk+ZhdvuxZDef1
 iTZfonE6FdcZfgnqHO7skSNd5VioWXY0Rrtk/xlBo6hk8CTjosp0yAqHtumfjl6k+TXV6e
 7OWLpenDHrGwKuR/WenI4yXUII3mnk8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-sy1We8JROcmh4bU4oYEbSQ-1; Tue, 27 Sep 2022 05:10:17 -0400
X-MC-Unique: sy1We8JROcmh4bU4oYEbSQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 61-20020a9d0843000000b0065bed802a93so4413860oty.2
 for <qemu-trivial@nongnu.org>; Tue, 27 Sep 2022 02:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e9V4mOxC7ZTYZ2NRPEsPcHZxTuIPyyP5Ra1HTlnicr0=;
 b=ghbkpj3AgvY04m2S8cTTHd2X/cgeJouR7/8WZvQtqaNyJf0Td1FnImw9B/amRBAfx7
 e+T20QH6JL0vvaToftdG9CM7AmcnNgZ5O9arQXlFJ1xyzli/iKRRpeT+sP+LHhEkIPGO
 98BjKVnUSzVdkXcsc3HCVKFyl6+OlpdqZiReEcCTMcO//koJSUsZJ7pFkwOsErAmaxSS
 zaFWpCK59um00smanMLXXouyNA9o7jBrv6l4l5vzORd6gNjcVEVvmEx5ByH6SGbgjf2j
 IkC2QS5iMDa5u4T2feEi9IJ5p5WDLabM7BUCUfgceW19v2NzjpsI5qSX+jmuWDlDLfp/
 GZFw==
X-Gm-Message-State: ACrzQf1A4e6kDC1RRxhVjflsCO7KWEmGjCunw4XPi8mT7YiJXor/Uyx/
 cdFq9efHt4SJuQ3omkxfWy65bXW4UiHp7LHLAPunCS4ok1gwtfG5S/8O5IbLqSNDw2bEiPR6BHi
 YCCE24YXo7DzZjBKp16/JsoZPbacxePCMsA==
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr11974034otu.378.1664269815790; 
 Tue, 27 Sep 2022 02:10:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cEz0rnXNRNU51kR4DX5EADmZvjLRlQppSViZZKNiF2kbxfDUbGMIG0fQ2+zjNRPO4nAPUjOntiUOykZgL/CE=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr11974028otu.378.1664269815525; Tue, 27
 Sep 2022 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110746.2769518-1-stefanb@linux.ibm.com>
In-Reply-To: <20220926110746.2769518-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 13:10:04 +0400
Message-ID: <CAMxuvax8sJVS=F_LaLYzBbf2DOEUWcxRTQKTy9qd=6v8oFrF9A@mail.gmail.com>
Subject: Re: [PATCH] docs: Add --tpm2 option to swtpm command line
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 27 Sep 2022 09:10:24 -0000

Hi

On Mon, Sep 26, 2022 at 3:39 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Add the --tpm2 option to the swtpm command line to run a TPM 2.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  docs/specs/tpm.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..243e24b692 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -304,6 +304,7 @@ a socket interface. They do not need to be run as root.
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=/tmp/mytpm1 \
>      --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> +    --tpm2 \
>      --log level=20

Why only there? The next paragraphs shows usage of TIS device and
dmesg logs of 1.2 TPM.

>
>  Command line to start QEMU with the TPM emulator device communicating
> --
> 2.37.2
>



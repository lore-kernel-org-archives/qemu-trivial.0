Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sEqn8-0001xk-6T
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2024 09:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sEqn6-0001xA-M1
 for qemu-trivial@nongnu.org; Wed, 05 Jun 2024 09:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sEqn5-00031J-5I
 for qemu-trivial@nongnu.org; Wed, 05 Jun 2024 09:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717594498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZZPtrDu9x28REqGTPIWhw9vKCAfhpoOi3laR69ZUMY=;
 b=SrAmdqZxVWt3q8p7G9Nmc85bi6lIcbXNNBX5cqH8HCwoVV60odU+0XXaAaNJanApoz3y/4
 7Sm993xOe6ez8Xy1RKc9e0EpoCNaVzfroAe0ZtAUuqKuVBfLLy4au40oLa766RjwZIVnq6
 g472J0LIPTJuhOual51va4XrnGOBWu8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-HlGII0gBP_uc8NaoIwYEWQ-1; Wed, 05 Jun 2024 09:34:56 -0400
X-MC-Unique: HlGII0gBP_uc8NaoIwYEWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-35dcde1be6cso1525733f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 05 Jun 2024 06:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717594493; x=1718199293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZZPtrDu9x28REqGTPIWhw9vKCAfhpoOi3laR69ZUMY=;
 b=Ru6ZSYl8eqV7Cklzos3EG1vbzqnIOaes3RGUSAA74EW7XujIxFzoLwvq1c8VeGwo2Q
 qXIEqjjdaRH6kjuZ4M65RlUJ6Oa2BbcElsJpVnMd9AUGfpb8bSkvx0sIOj5YkM/qP7zn
 WHqVqtI7Z0zxR5CUh9ToQG7yAn1yKlqYx1iYPrg/FvnnOrXIqkpkGbYfG5oBIY9R1KzW
 4+KC/OokR7MXGp13+HFowSUFepTAA8/bwcdRNistNI7D88s1Se4GY60c7STqjab3qHqj
 7IRjMxxJLzrDdbb1m02nWBzepqtMoIbIJgZzBbXQmLx8RSH4WMNznsuClKKPuiyRNvrr
 wcEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqsPgfp5Fh8yf2jafOf55wCntaMuIOeM9JOTwe1o8JCuqOo/wQjZdwsTGv9L9/84mFsBM0DzNPiP8S9lKeh34aO8i4JYFARA==
X-Gm-Message-State: AOJu0Yy+qtz4tITv8EwxReCoE+sAa3isipIBJeDJwlYQNxnadx7sMr5X
 7ETqLK+Z38C20DDXkgiO+jrOC2a0Y9hWxwTTPBmiIc4gUjenslGkW9C1AfbUecFISxc4OX2uZ/4
 nA6ukSh0V9/avXO7RJT5KePexGRXLOUpWf5bWYv8YRqPRlioajFPGmEk=
X-Received: by 2002:a5d:53c6:0:b0:35e:7cc6:98fc with SMTP id
 ffacd0b85a97d-35e8405e26cmr1839246f8f.12.1717594493297; 
 Wed, 05 Jun 2024 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtZaH7DB2hwXC0W2u7ZsPckXWfoKYcGOmQvBK0l8NtX+l6NDw82TGaOGdWenjhDnbmKjQS4w==
X-Received: by 2002:a5d:53c6:0:b0:35e:7cc6:98fc with SMTP id
 ffacd0b85a97d-35e8405e26cmr1839229f8f.12.1717594492980; 
 Wed, 05 Jun 2024 06:34:52 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04ca434sm14608816f8f.30.2024.06.05.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 06:34:52 -0700 (PDT)
Date: Wed, 5 Jun 2024 15:34:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Zide Chen <zide.chen@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mst@redhat.com,
 thuth@redhat.com, cfontana@suse.de, xiaoyao.li@intel.com,
 qemu-trivial@nongnu.org, seanjc@google.com, zhao1.liu@intel.com
Subject: Re: [PATCH V3 1/2] vl: Allow multiple -overcommit commands
Message-ID: <20240605153451.5c234180@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240604000222.75065-2-zide.chen@intel.com>
References: <20240604000222.75065-1-zide.chen@intel.com>
 <20240604000222.75065-2-zide.chen@intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jun 2024 13:35:00 -0000

On Mon,  3 Jun 2024 17:02:21 -0700
Zide Chen <zide.chen@intel.com> wrote:

> Both cpu-pm and mem-lock are related to system resource overcommit, but
> they are separate from each other, in terms of how they are realized,
> and of course, they are applied to different system resources.
> 
> It's tempting to use separate command lines to specify their behavior.
> e.g., in the following example, the cpu-pm command is quietly
> overwritten, and it's not easy to notice it without careful inspection.
> 
>   --overcommit mem-lock=on
>   --overcommit cpu-pm=on
> 
> Fixes: c8c9dc42b7ca ("Remove the deprecated -realtime option")
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> 
> V3: added Reviewed-by
> 
> v2:
> Thanks to Thomas' suggestion, changed to this better approach, which
> is more generic and can handle situations like: "enabled the option in
> the config file, and now you'd like to disable it on the command line
> again".
> 
>  system/vl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/system/vl.c b/system/vl.c
> index a3eede5fa5b8..dfa6cdd9283b 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -3545,8 +3545,8 @@ void qemu_init(int argc, char **argv)
>                  if (!opts) {
>                      exit(1);
>                  }
> -                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", false);
> -                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", false);
> +                enable_mlock = qemu_opt_get_bool(opts, "mem-lock", enable_mlock);
> +                enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", enable_cpu_pm);
>                  break;
>              case QEMU_OPTION_compat:
>                  {



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olUQM-0001wO-0V
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2022 08:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olUQ2-0001aY-5k
 for qemu-trivial@nongnu.org; Thu, 20 Oct 2022 08:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olUPw-0007RK-CU
 for qemu-trivial@nongnu.org; Thu, 20 Oct 2022 08:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666267973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bImTESfjJnuUtLWNSEADaNzhEhJ1vF2ocBmTYqaJyHU=;
 b=RMrgrkEkCVH082tu+zTEpsGAvIMtBGpFE5s+BOeWwpXvC0KXRkGXzyxaAgSST+h+vSl07H
 AAvQvI+Ul8R03oEmClmWrH5HxcVZxeUa3BI59VKlGBExnXypWRUV7eUh6KJigWXmmX3/qQ
 TuuGR09mKLLRaD9VTXWxpK9fA2iODeY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-lbNAJJ6KPzieksABaudXsA-1; Thu, 20 Oct 2022 08:12:50 -0400
X-MC-Unique: lbNAJJ6KPzieksABaudXsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF062A2AD4C;
 Thu, 20 Oct 2022 12:12:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E24F1121315;
 Thu, 20 Oct 2022 12:12:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA78B21E6808; Thu, 20 Oct 2022 14:12:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] Drop useless casts from void * to pointer
References: <20220923120025.448759-1-armbru@redhat.com>
Date: Thu, 20 Oct 2022 14:12:48 +0200
In-Reply-To: <20220923120025.448759-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 23 Sep 2022 14:00:22 +0200")
Message-ID: <87a65qbsn3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Oct 2022 12:13:15 -0000

Could this go via qemu-trivial now?



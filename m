Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qo05E-0003qC-19
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 07:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qo05C-0003pl-Fj
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 07:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qo05B-00040t-6A
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 07:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696419023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nqXxIK+koc44STjQol038vLzvkmM8vU3y0ishhzRXTk=;
 b=LzSbmGXdHMs9Y10YPPgQ4VXbkQNK1gQjEdIIPfDTXo1EsJ7/Z43rS3mBgP2iRX1osHoDKf
 bpCk3Le+l0rp1oIbZRUuBhKtj/bNZXGL7yQtq1rC6c+mNMjmjY4j9zER9T0QnJegJ6h67j
 ARyGRJlaXsDhzc+Qqn5HAceLNJIMJYI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-3jj8oiKDO56n7XfcMfAJkQ-1; Wed, 04 Oct 2023 07:30:22 -0400
X-MC-Unique: 3jj8oiKDO56n7XfcMfAJkQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 267CE381258C;
 Wed,  4 Oct 2023 11:30:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25A6493113;
 Wed,  4 Oct 2023 11:30:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 039EB21E6904; Wed,  4 Oct 2023 13:30:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] hw/virtio/virtio-pci: Avoid compiler warning with
 -Wshadow
References: <20231004095302.99037-1-thuth@redhat.com>
Date: Wed, 04 Oct 2023 13:30:20 +0200
In-Reply-To: <20231004095302.99037-1-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 4 Oct 2023 11:53:02 +0200")
Message-ID: <87lecifwvn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Oct 2023 11:30:26 -0000

Thomas Huth <thuth@redhat.com> writes:

> "len" is used as parameter of the functions virtio_write_config()
> and virtio_read_config(), and additionally as a local variable,
> so this causes a compiler warning when compiling with "-Wshadow"
> and can be confusing for the reader. Rename the local variables
> to "caplen" to avoid this problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

v1 unqueued, this one queued.  Thanks!



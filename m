Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKF07-00041a-QU
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2013 17:32:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKF03-00040q-HW
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2013 17:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKF00-0005m3-Cc
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2013 17:32:15 -0400
Received: from e8.ny.us.ibm.com ([32.97.182.138]:59295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKF00-0005fd-79
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2013 17:32:12 -0400
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 25 Mar 2013 17:31:59 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 25 Mar 2013 17:31:56 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 98BE438C804D
	for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2013 17:31:55 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r2PLVtUE291870
	for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2013 17:31:55 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r2PLVsQ9014851
	for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2013 18:31:55 -0300
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r2PLVs4x014839; Mon, 25 Mar 2013 18:31:54 -0300
Message-ID: <5150C24A.4030208@linux.vnet.ibm.com>
Date: Mon, 25 Mar 2013 17:31:54 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------090406080005040008010001"
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13032521-9360-0000-0000-00001177B0E4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Corey Bryant <coreyb@linux.vnet.ibm.com>,
	Joel Schopp <jschopp@linux.vnet.ibm.com>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] vNVRAM / blobstore design
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
X-List-Received-Date: Mon, 25 Mar 2013 21:32:18 -0000

This is a multi-part message in MIME format.
--------------090406080005040008010001
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

I am posting this message to revive the previous discussions about the 
design of vNVRAM / blobstore cc'ing (at least) those that participated 
in this discussion 'back then'.

The first goal of the implementation is to provide an vNVRAM storage for 
a software implementation of a TPM to store its different blobs into. 
Some of the data that the TPM writes into persistent memory needs to 
survive a power down / power up cycle of a virtual machine, therefore 
this type of persistent storage is needed. For the vNVRAM not to become 
a road-block for VM migration, we would make use of block device 
migration and layer the vNVRAM on top of the block device, therefore 
using virtual machine images for storing the vNVRAM data.

Besides the TPM blobs the vNVRAM should of course also be able able to 
accommodate other use cases where persistent data is stored into NVRAM, 
BBRAM (battery backed-up RAM) or EEPROM. As far as I know more recent 
machines with UEFI also have such types of persistent memory. I believe 
the current design of the vNVRAM layer accommodates other use cases as 
well, though additional 'glue devices' would need to be implemented to 
interact with this vNVRAM layer.

Here is a reference to the previous discussion:

http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01791.html
http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01967.html

Two aspects of the vNVRAM seem of primary interest: its API and how the 
data is organized in the virtual machine image leaving its inner 
workings to the side for now.


API of the vNVRAM:
------------------

The following functions and data structures are important for devices:


enum NVRAMRWOp {
     NVRAM_OP_READ,
     NVRAM_OP_WRITE,
     NVRAM_OP_FORMAT
};

/**
  * Callback function a device must provide for reading and writing
  * of blobs as well as for indicating to the NVRAM layer the maximum
  * blob size of the given entry. Due to the layout of the data in the
  * NVRAM, the device must always write a blob with the size indicated
  * during formatting.
  * @op: Indication of the NVRAM operation
  * @v: Input visitor in case of a read operation, output visitor in
  *     case of a write or format operation.
  * @entry_name: Unique name of the NVRAM entry
  * @opaque: opaque data previously provided when registering the NVRAM
  *          entry
  * @errp: Pointer to an Error pointer for the visitor to indicate error
  */
typedef int (*NVRAMRWData)(enum NVRAMRWOp op, Visitor *v,
                            const NVRAMEntryName *entry_name, void *opaque,
                            Error **errp);

/**
  * nvram_setup:
  * @drive_id: The ID of the drive to be used as NVRAM. Following the 
command
  *            line '-drive if=none,id=tpm-bs,file=<file>' 'tpm-bs' would
  *            have to be passed.
  * @errcode: Pointer to an integer for an error code
  * @resetfn : Device reset function
  * @dev: The DeviceState to be passed to the device reset function @resetfn
  *
  * This function returns a pointer to VNVRAM or NULL in case an error 
occurred
  */
VNVRAM *nvram_setup(const char *drive_id, int *errcode,
                     qdev_resetfn resetfn, DeviceState *dev);

/**
  * nvram_delete:
  * @nvram: The NVRAM to destroy
  *
  * Destroy the NVRAM previously allocated using nvram_setup.
  */
int nvram_delete(VNVRAM *nvram);

/**
  * nvram_start:
  * @nvram: The NVRAM to start
  * @fail_on_encrypted_drive: Fail if the drive is encrypted but no
  *                           key was provided so far to lower layers.
  *
  * After all blobs that the device intends to write have been registered
  * with the NVRAM, this function is used to start up the NVRAM. In case
  * no error occurred, 0 is returned, an error code otherwise.
  */
int nvram_start(VNVRAM *nvram, bool fail_on_encrypted_drive);

/**
  * nvram_process_requests:
  *
  * Have the NVRAM layer process all outstanding requests and wait
  * for their completion.
  */
void nvram_process_requests(void);

/**
  * nvram_register_entry:
  *
  * @nvram: The NVRAM to register an entry with
  * @entry_name: The unique name of the blob to register
  * @rwdata_callback: Callback function for the NVRAM layer to
  *                   invoke for asynchronous requests such as
  *                   delivering the results of a read operation
  *                   or requesting the maximum size of the blob
  *                   when formatting.
  * @opaque: Data to pass to the callback function
  *
  * Register an entry for the NVRAM layer to write. In case of success
  * this function returns 0, an error code otherwise.
  */
int nvram_register_entry(VNVRAM *nvram, const NVRAMEntryName *entry_name,
                          NVRAMRWData rwdata_callback, void *opaque);

/**
  * nvram_deregister_entry:
  * @nvram: The NVRAM to deregister an entry from
  * @entry_name: the unique name of the entry
  *
  * Deregister an NVRAM entry previously registered with the NVRAM layer.
  * The function returns 0 on success, an error code on failure.
  */
int nvram_deregister_entry(VNVRAM *nvram, const NVRAMEntryName *entry_name);

/**
  * nvram_had_fatal_error:
  * @nvram: The NVRAM to check
  *
  * Returns true in case the NVRAM had a fatal error and
  * is unusable, false if the device can be used.
  */
bool nvram_had_fatal_error(VNVRAM *nvram);

/**
  * nvram_write_data:
  * @nvram: The NVRAM to write the data to
  * @entry_name: The name of the blob to write
  * @flags: Flags indicating sychronouse or asynchronous
  *         operation and whether to wait for completion
  *         of the operation.
  * @cb: callback to invoke for an async write
  * @opaque: data to pass to the callback
  *
  * Write data into NVRAM. This function will invoke the callback
  * provided in nvram_setup where an output visitor will be
  * provided for writing the blob. This function returns 0 in case
  * of success, an error code otherwise.
  */
int nvram_write_data(VNVRAM *nvram, const NVRAMEntryName *entry_name,
                      int flags, NVRAMRWFinishCB cb, void *opaque);

/**
  * nvram_write_data:
  * @nvram: The NVRAM to read the data from
  * @entry_name: The name of the blob tow rite
  * @flags: Flags indicating sychronouse or asynchronous
  *         operation and whether to wait for completion
  *         of the operation.
  * @cb: callback to invoke for an async read
  * @opaque: data to pass to the callback
  *
  * Read data from NVRAM. This function will invoke the callback
  * provided in nvram_setup where an input visitor will be
  * provided for reading the data. This function return 0 in
  * case of success, an error code otherwise.
  */
int nvram_read_data(VNVRAM *nvram, const NVRAMEntryName *entry_name,
                     int flags, NVRAMRWFinishCB cb, void *opaque);

/* flags used above */
#define VNVRAM_ASYNC_F              (1 << 0)
#define VNVRAM_WAIT_COMPLETION_F    (1 << 1)



Organization of the data in the virtual machine image:
------------------------------------------------------

All data on the VM image are written as a single ASN.1 stream with a 
header followed by the individual fixed-sized NVRAM entries. The NVRAM 
layer creates the header during an NVRAM formatting step that must be 
initiated by the user (or libvirt) through an HMP or QMP command.

The fact that we are writing ASN.1 formatted data into the virtual 
machine image is also the reason for the recent posts of the ASN.1 
visitor patch series.


/*
  * The NVRAM on-disk format is as follows:
  * Let '{' and '}' denote an ASN.1 sequence start and end.
  *
  * {
  *   NVRAM-header: "qemu-nvram"
  *   # a sequence of blobs:
  *   {
  *     1st NVRAM entry's name
  *     1st NVRAM entry's ASN.1 blob (fixed size)
  *   }
  *   {
  *     2nd NVRAM entry's name
  *     2nd NVRAM entry's ASN.1 blob (fixed size)
  *   }
  *   ...
  * }
  */

NVRAM entries are read by searching for the entry identified by its 
unique name. If it is found, the device's callback function is invoked 
with an input visitor for the device to read the data.

NVRAM entries are written by searching for the entry identified by its 
unique name. If it is found, the device's callback function is invoked 
with an output visitor positioned to where the data need to be written 
to in the VM image. The device then uses the visitor directly to write 
the blob.

The ASN.1 blobs have to be of fixed size since an inflating or deflating 
1st blob would require that all subsequent blobs be moved or destroy the 
integrity of the ASN.1 stream.


One complication is the requirements on size of the NVRAM and the fact 
the virtual machine images typically don't grow. Here users may need 
a-priori knowledge as to what the size of the NVRAM has to be for the 
device to properly work. In case of the the TPM for example, the TPM 
requires a virtual machine image of a certain size for it to be able to 
write all its blobs into. It may be necessary for human users to start 
QEMU once to find out the required size of the NVRAM image (using an HMP 
command) or get it through documentation. In the case of libvirt the 
required image size could be hard coded into libvirt since it will not 
change anymore and is a property of the device. Another possibility 
would be to use QEMU APIs to re-size the image before formatting (this 
at least did not work a few months ago if I recall correctly, or did not 
work with all VM image formats; details here faded from memory...)

I think this is enough detail for now. Please let me know of any 
comments you may have. My primary concern for now is to get clarity on 
the layout of the data inside the virtual machine image. The ASN.1 
visitors were written for this purpose.


Thanks and regards,
     Stefan


--------------090406080005040008010001
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="Courier New, Courier, monospace">Hello!<br>
      <br>
      I am posting this message to revive the previous discussions about
      the design of vNVRAM / blobstore cc'ing (at least) those that
      participated in this discussion 'back then'.<br>
      <br>
      The first goal of the implementation is to provide an vNVRAM
      storage for a software implementation of a TPM to store its
      different blobs into. Some of the data that the TPM writes into
      persistent memory needs to survive a power down / power up cycle
      of a virtual machine, therefore this type of persistent storage is
      needed. For the vNVRAM not to become a road-block for VM
      migration, we would make use of block device migration and layer
      the vNVRAM on top of the block device, therefore using virtual
      machine images for storing the vNVRAM data.<br>
      <br>
      Besides the TPM blobs the vNVRAM should of course also be able
      able to accommodate other use cases where persistent data is
      stored into NVRAM, BBRAM (battery backed-up RAM) or EEPROM. As far
      as I know more recent machines with UEFI also have such types of
      persistent memory. I believe the current design of the vNVRAM
      layer accommodates other use cases as well, though additional
      'glue devices' would need to be implemented to interact with this
      vNVRAM layer.<br>
      <br>
      Here is a reference to the previous discussion:<br>
      <br>
      <a class="moz-txt-link-freetext" href="http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01791.html">http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01791.html</a><br>
      <a class="moz-txt-link-freetext" href="http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01967.html">http://lists.gnu.org/archive/html/qemu-devel/2011-09/msg01967.html</a><br>
      <br>
      Two aspects of the vNVRAM seem of primary interest: its API and
      how the data is organized in the virtual machine image leaving its
      inner workings to the side for now.<br>
    </font><font face="Courier New, Courier, monospace"><font
        face="Courier New, Courier, monospace"><br>
        <br>
      </font>API of the vNVRAM:<br>
      ------------------<br>
      <br>
      The following functions and data structures are important for
      devices:<br>
      <br>
      <br>
      enum NVRAMRWOp {<br>
      &nbsp;&nbsp;&nbsp; NVRAM_OP_READ,<br>
      &nbsp;&nbsp;&nbsp; NVRAM_OP_WRITE,<br>
      &nbsp;&nbsp;&nbsp; NVRAM_OP_FORMAT<br>
      };<br>
      <br>
      /**<br>
      &nbsp;* Callback function a device must provide for reading and writing<br>
      &nbsp;* of blobs as well as for indicating to the NVRAM layer the
      maximum<br>
      &nbsp;* blob size of the given entry. Due to the layout of the data in
      the<br>
      &nbsp;* NVRAM, the device must always write a blob with the size
      indicated<br>
      &nbsp;* during formatting.<br>
      &nbsp;* @op: Indication of the NVRAM operation<br>
      &nbsp;* @v: Input visitor in case of a read operation, output visitor
      in<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp; case of a write or format operation.<br>
      &nbsp;* @entry_name: Unique name of the NVRAM entry<br>
      &nbsp;* @opaque: opaque data previously provided when registering the
      NVRAM<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entry<br>
      &nbsp;* @errp: Pointer to an Error pointer for the visitor to indicate
      error<br>
      &nbsp;*/<br>
      typedef int (*NVRAMRWData)(enum NVRAMRWOp op, Visitor *v,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const NVRAMEntryName *entry_name, void
      *opaque,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error **errp);<br>
      <br>
      /**<br>
      &nbsp;* nvram_setup:<br>
      &nbsp;* @drive_id: The ID of the drive to be used as NVRAM. Following
      the command<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; line '-drive if=none,id=tpm-bs,file=&lt;file&gt;'
      'tpm-bs' would<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; have to be passed.<br>
      &nbsp;* @errcode: Pointer to an integer for an error code<br>
      &nbsp;* @resetfn : Device reset function<br>
      &nbsp;* @dev: The DeviceState to be passed to the device reset function
      @resetfn<br>
      &nbsp;*<br>
      &nbsp;* This function returns a pointer to VNVRAM or NULL in case an
      error occurred<br>
      &nbsp;*/<br>
      VNVRAM *nvram_setup(const char *drive_id, int *errcode,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qdev_resetfn resetfn, DeviceState *dev);<br>
      <br>
      /**<br>
      &nbsp;* nvram_delete:<br>
      &nbsp;* @nvram: The NVRAM to destroy<br>
      &nbsp;*<br>
      &nbsp;* Destroy the NVRAM previously allocated using nvram_setup.<br>
      &nbsp;*/<br>
      int nvram_delete(VNVRAM *nvram);<br>
      <br>
      /**<br>
      &nbsp;* nvram_start:<br>
      &nbsp;* @nvram: The NVRAM to start<br>
      &nbsp;* @fail_on_encrypted_drive: Fail if the drive is encrypted but no<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key was provided so far to lower
      layers.<br>
      &nbsp;*<br>
      &nbsp;* After all blobs that the device intends to write have been
      registered<br>
      &nbsp;* with the NVRAM, this function is used to start up the NVRAM. In
      case<br>
      &nbsp;* no error occurred, 0 is returned, an error code otherwise.<br>
      &nbsp;*/<br>
      int nvram_start(VNVRAM *nvram, bool fail_on_encrypted_drive);<br>
      <br>
      /**<br>
      &nbsp;* nvram_process_requests:<br>
      &nbsp;*<br>
      &nbsp;* Have the NVRAM layer process all outstanding requests and wait<br>
      &nbsp;* for their completion.<br>
      &nbsp;*/<br>
      void nvram_process_requests(void);<br>
      <br>
      /**<br>
      &nbsp;* nvram_register_entry:<br>
      &nbsp;*<br>
      &nbsp;* @nvram: The NVRAM to register an entry with<br>
      &nbsp;* @entry_name: The unique name of the blob to register<br>
      &nbsp;* @rwdata_callback: Callback function for the NVRAM layer to<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invoke for asynchronous requests such as<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; delivering the results of a read operation<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or requesting the maximum size of the blob<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; when formatting.<br>
      &nbsp;* @opaque: Data to pass to the callback function<br>
      &nbsp;*<br>
      &nbsp;* Register an entry for the NVRAM layer to write. In case of
      success<br>
      &nbsp;* this function returns 0, an error code otherwise.<br>
      &nbsp;*/<br>
      int nvram_register_entry(VNVRAM *nvram, const NVRAMEntryName
      *entry_name,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NVRAMRWData rwdata_callback, void
      *opaque);<br>
      <br>
      /**<br>
      &nbsp;* nvram_deregister_entry:<br>
      &nbsp;* @nvram: The NVRAM to deregister an entry from<br>
      &nbsp;* @entry_name: the unique name of the entry<br>
      &nbsp;*<br>
      &nbsp;* Deregister an NVRAM entry previously registered with the NVRAM
      layer.<br>
      &nbsp;* The function returns 0 on success, an error code on failure.<br>
      &nbsp;*/<br>
      int nvram_deregister_entry(VNVRAM *nvram, const NVRAMEntryName
      *entry_name);<br>
      <br>
      /**<br>
      &nbsp;* nvram_had_fatal_error:<br>
      &nbsp;* @nvram: The NVRAM to check<br>
      &nbsp;*<br>
      &nbsp;* Returns true in case the NVRAM had a fatal error and<br>
      &nbsp;* is unusable, false if the device can be used.<br>
      &nbsp;*/<br>
      bool nvram_had_fatal_error(VNVRAM *nvram);<br>
      <br>
      /**<br>
      &nbsp;* nvram_write_data:<br>
      &nbsp;* @nvram: The NVRAM to write the data to<br>
      &nbsp;* @entry_name: The name of the blob to write<br>
      &nbsp;* @flags: Flags indicating sychronouse or asynchronous<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; operation and whether to wait for completion<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of the operation.<br>
      &nbsp;* @cb: callback to invoke for an async write<br>
      &nbsp;* @opaque: data to pass to the callback<br>
      &nbsp;*<br>
      &nbsp;* Write data into NVRAM. This function will invoke the callback<br>
      &nbsp;* provided in nvram_setup where an output visitor will be<br>
      &nbsp;* provided for writing the blob. This function returns 0 in case<br>
      &nbsp;* of success, an error code otherwise.<br>
      &nbsp;*/<br>
      int nvram_write_data(VNVRAM *nvram, const NVRAMEntryName
      *entry_name,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int flags, NVRAMRWFinishCB cb, void *opaque);<br>
      <br>
      /**<br>
      &nbsp;* nvram_write_data:<br>
      &nbsp;* @nvram: The NVRAM to read the data from<br>
      &nbsp;* @entry_name: The name of the blob tow rite<br>
      &nbsp;* @flags: Flags indicating sychronouse or asynchronous<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; operation and whether to wait for completion<br>
      &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of the operation.<br>
      &nbsp;* @cb: callback to invoke for an async read<br>
      &nbsp;* @opaque: data to pass to the callback<br>
      &nbsp;*<br>
      &nbsp;* Read data from NVRAM. This function will invoke the callback<br>
      &nbsp;* provided in nvram_setup where an input visitor will be<br>
      &nbsp;* provided for reading the data. This function return 0 in<br>
      &nbsp;* case of success, an error code otherwise.<br>
      &nbsp;*/<br>
      int nvram_read_data(VNVRAM *nvram, const NVRAMEntryName
      *entry_name,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int flags, NVRAMRWFinishCB cb, void *opaque);<br>
      <br>
      /* flags used above */<br>
      #define VNVRAM_ASYNC_F&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 &lt;&lt; 0)<br>
      #define VNVRAM_WAIT_COMPLETION_F&nbsp;&nbsp;&nbsp; (1 &lt;&lt; 1)<br>
      <br>
      <br>
      <br>
    </font><font face="Courier New, Courier, monospace"><font
        face="Courier New, Courier, monospace">Organization of the data
        in the virtual machine image:<br>
        ------------------------------------------------------<br>
        <br>
        All data on the VM image are written as a single ASN.1 stream
        with a header followed by the individual fixed-sized NVRAM
        entries. The NVRAM layer creates the header during an NVRAM
        formatting step that must be initiated by the user (or libvirt)
        through an HMP or QMP command.<br>
        <br>
        The fact that we are writing ASN.1 formatted data into the
        virtual machine image is also the reason for the recent posts of
        the ASN.1 visitor patch series.<br>
        <br>
        <br>
        /*<br>
        &nbsp;* The NVRAM on-disk format is as follows:<br>
        &nbsp;* Let '{' and '}' denote an ASN.1 sequence start and end.<br>
        &nbsp;*<br>
        &nbsp;* {<br>
        &nbsp;*&nbsp;&nbsp; NVRAM-header: "qemu-nvram"<br>
        &nbsp;*&nbsp;&nbsp; # a sequence of blobs:<br>
        &nbsp;*&nbsp;&nbsp; {<br>
        &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp; 1st NVRAM entry's name<br>
        &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp; 1st NVRAM entry's ASN.1 blob (fixed size)<br>
        &nbsp;*&nbsp;&nbsp; }<br>
        &nbsp;*&nbsp;&nbsp; {<br>
        &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp; 2nd NVRAM entry's name<br>
        &nbsp;*&nbsp;&nbsp;&nbsp;&nbsp; 2nd NVRAM entry's ASN.1 blob (fixed size)<br>
        &nbsp;*&nbsp;&nbsp; }<br>
        &nbsp;*&nbsp;&nbsp; ...<br>
        &nbsp;* }<br>
        &nbsp;*/<br>
        <br>
        NVRAM entries are read by searching for the entry identified by
        its unique name. If it is found, the device's callback function
        is invoked with an input visitor for the device to read the
        data.<br>
        <br>
        NVRAM entries are written by searching for the entry identified
        by its unique name. If it is found, the device's callback
        function is invoked with an output visitor positioned to where
        the data need to be written to in the VM image. The device then
        uses the visitor directly to write the blob.<br>
        <br>
        The ASN.1 blobs have to be of fixed size since an inflating or
        deflating 1st blob would require that all subsequent blobs be
        moved or destroy the integrity of the ASN.1 stream.<br>
        <br>
        <br>
      </font></font><font face="Courier New, Courier, monospace"><font
        face="Courier New, Courier, monospace"><font face="Courier New,
          Courier, monospace"><font face="Courier New, Courier,
            monospace">One complication is the requirements on size of
            the NVRAM and the fact the virtual machine images typically
            don't grow. Here users may need a-priori knowledge as to
            what the size of the NVRAM has to be for the device to
            properly work. In case of the the TPM for example, the TPM
            requires a virtual machine image of a certain size for it to
            be able to write all its blobs into. It may be necessary for
            human users to start QEMU once to find out the required size
            of the NVRAM image </font></font></font></font><font
      face="Courier New, Courier, monospace"><font face="Courier New,
        Courier, monospace"><font face="Courier New, Courier, monospace"><font
            face="Courier New, Courier, monospace"><font face="Courier
              New, Courier, monospace"><font face="Courier New, Courier,
                monospace"><font face="Courier New, Courier, monospace"><font
                    face="Courier New, Courier, monospace">(using an HMP
                    command)</font></font></font></font> or get it
            through documentation. In the case of libvirt the required
            image size could be hard coded</font></font> into libvirt
        since it will not change anymore and is a property of the
        device. Another possibility would be to use QEMU APIs to re-size
        the image before formatting (<font face="Courier New, Courier,
          monospace"><font face="Courier New, Courier, monospace">this
            at least did not work a few months ago if I recall
            correctly, or did not work with all VM image formats;
            details here faded from memory...)</font></font></font></font><br>
    <font face="Courier New, Courier, monospace"><font face="Courier
        New, Courier, monospace"><br>
        I think this is enough detail for now. Please let me know of any
        comments you may have. My primary concern for now is to get
        clarity on the layout of the data inside the virtual machine
        image. The ASN.1 visitors were written for this purpose.<br>
        <br>
        <br>
        Thanks and regards,<br>
        &nbsp;&nbsp;&nbsp; Stefan<br>
        <br>
      </font></font>
  </body>
</html>

--------------090406080005040008010001--



from netCDF4 import Dataset

filenameBase = "./output_hex_wachspress/output.2000.nc"
filenameDiff = "./output_hex_pwl/output.2000.nc"
#filenameDiff = "./output_hex_weak/output.2000.nc"
fieldname = "uVelocity"

filein = Dataset(filenameBase,"r")

field1 = filein.variables[fieldname][:]

dimensionsBase = filein.variables[fieldname].dimensions

filein.close()


fileDiff = Dataset(filenameDiff,"a")

field2 = filein.variables[fieldname][:]

fieldDiff = fileDiff.createVariable(fieldname+"Diff", "d", dimensions=dimensionsBase)

fieldDiff[:] = field2[:] - field1[:]

fileDiff.close()
